<?php
require("../../../util/dataProvider.php");
require("../../../util/pagination.php");
$dp = new DataProvider();

$priceRange = getPriceRange();
$priceStart = isset($_POST['priceStart']) && $_POST['priceStart'] !== "" ? $_POST['priceStart'] : $priceRange['minPrice'];
$priceEnd = isset($_POST['priceEnd']) && $_POST['priceEnd'] !== "" ? $_POST['priceEnd'] : $priceRange['maxPrice'];
$name = isset($_POST['name']) ? $_POST['name'] : "";
$category = isset($_POST['category']) ? $_POST['category'] : 0;
$currentPage = isset($_POST['currentPage']) ? $_POST['currentPage'] : 1;

// $priceRange = getPriceRange();
// $priceStart = isset($_POST['priceStart']) && $_POST['priceStart'] !== "" ? $_POST['priceStart'] : $priceRange['minPrice'];
// $priceEnd = isset($_POST['priceEnd']) && $_POST['priceEnd'] !== "" ? $_POST['priceEnd'] : $priceRange['maxPrice'];
// $name = $_POST['name'];
// $category = $_POST['category'];
// $priceStart = $_POST['priceStart'];
// $priceEnd = $_POST['priceEnd'];
$currentPage = $_POST['currentPage'];
$album = getAlbums($name, $category, $priceStart, $priceEnd);
// for ($j = 1; $j < 3; $j++) {
//   $max = count($album);
//   for ($i = 0; $i < $max; $i++) {
//     array_push($album, $album[$i]);
//   }
// }
$pa = new Pagination($album, 8, $currentPage);

$slides = getAllSlide();
?>

<div id="home">
  <div class="header-category">
    <div class="category-item <?= $category == 0 ? 'active' : '' ?>" data-value="0" onclick="filterByCategory(0)">ALL</div>
    <div class="category-item <?= $category == 1 ? 'active' : '' ?>" data-value="1" onclick="filterByCategory(1)">BLUES</div>
    <div class="category-item <?= $category == 2 ? 'active' : '' ?>" data-value="2" onclick="filterByCategory(2)">ACOUSTIC</div>
    <div class="category-item <?= $category == 3 ? 'active' : '' ?>" data-value="3" onclick="filterByCategory(3)">CLASSICAL</div>
    <div class="category-item <?= $category == 4 ? 'active' : '' ?>" data-value="4" onclick="filterByCategory(4)">COUNTRY</div>
    <div class="category-item <?= $category == 5 ? 'active' : '' ?>" data-value="5" onclick="filterByCategory(5)">ELECTRONIC</div>
    <div class="category-item <?= $category == 6 ? 'active' : '' ?>" data-value="6" onclick="filterByCategory(6)">JAZZ</div>
    <div class="category-item <?= $category == 7 ? 'active' : '' ?>" data-value="7" onclick="filterByCategory(7)">POP/ROCK</div>
  </div>
  <div class="slideshow">
    <div class="left">
      <div class="poster">
        <div class="slider">
          <div class="list">
            <?php foreach ($slides as $slide): ?>
              <div class="item" onclick="loadProductDetailsByAjax(<?= $slide['linkTo'] ?>,'home')">
                <img src="data/slideShow/<?= $slide['linkHinh'] ?>" alt="img slide show">
              </div>
            <?php endforeach ?>
          </div>
          <button id="prev" class="prev" onclick="prevSlide()">
            <i class="fa-light fa-angle-left"></i>
          </button>
          <button id="next" class="next" onclick="nextSlide()">
            <i class="fa-light fa-angle-right"></i>
          </button>
          <ul class="dots">
            <li onclick="changeSlide(0)" class="active"></li>
            <?php for ($i = 1; $i < count($slides); $i++): ?>
              <li onclick="changeSlide(<?= $i ?>)"></li>
            <?php endfor ?>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <h1 id="features-title">Features</h1>
  <div class="grid-container">
    <?php for ($i = $pa->startProduct(); $i <= $pa->endProduct(); $i++): ?>
      <div class="grid-item" onclick="loadProductDetailsByAjax(<?= $album[$i]['maAlbum'] ?>)">
        <div class="img-container">
          <img src="data/imgAlbum/<?= $album[$i]["hinh"] ?>" alt="album\' s poster">
        </div>
        <p class="title">
          <?= $album[$i]["tenAlbum"] ?>
        </p>
        <p class="gray artist">
          <?= $album[$i]["tacGia"] ?>
        </p>
        <p class="price">
          <?= $album[$i]["gia"] ?> $
        </p>
      </div>
    <?php endfor ?>
  </div>
  <?php if ($pa->quantityPage > 1): ?>
    <div class="pagination-placeholder">
      <div class="pagination-box">
        <?php if ($currentPage > 1): ?>
          <div class="item" onclick="loadHomeByAjax(<?= $pa->prevDot() ?>)"><i class="fa-solid fa-chevron-left"></i>
          </div>
        <?php else: ?>
          <div class="item hide" style="cursor: default;"><i style="color: var(--gr1)" class="fa-solid fa-chevron-left"></i>
          </div>
        <?php endif ?>
        <div class="item">
          <?php echo $currentPage . " OF " . $pa->quantityPage ?>
        </div>
        <?php if ($currentPage < $pa->quantityPage): ?>
          <div class="item" onclick="loadHomeByAjax(<?= $pa->nextDot() ?>)"><i class="fa-solid fa-chevron-right"></i>
          </div>
        <?php else: ?>
          <div class="item hide" style="cursor: default;"><i style="color: var(--gr1)"
              class=" fa-solid fa-chevron-right"></i>
          </div>
        <?php endif ?>
      </div>
    </div>
  <?php endif ?>
</div>
<div id="detailProduct"></div>

<?php
function getAlbums($name, $category, $priceStart, $priceEnd)
{
  global $dp;
  $sql = "SELECT * FROM album where trangThai = 1 ";
  $f = false;
  if ($name != "" || $category != 0 || $priceStart != "" && $priceEnd != "") {
    $sql = $sql . "and ";
    if ($name != "") {
      $sql = $sql . "(tenAlbum LIKE '%" . $name . "%' ";
      $sql = $sql . " or tacGia LIKE '%" . $name . "%' )";
      $f = true;
    }
    if ($category != 0) {
      if ($f) {
        $sql = $sql . "and ";
      }
      $sql = $sql . "theLoai = " . $category . " ";
      $f = true;
    }
    if ($priceStart != "" && $priceEnd != "") {
      if ($f) {
        $sql = $sql . "and ";
      }
      $sql = $sql . "gia >= " . $priceStart . " and gia <= " . $priceEnd . " ";
      $f = true;
    }
  }
  $result = $dp->excuteQuery($sql);
  $album = array();
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($album, $row);
    }
  }
  return $album;
}

function getAllSlide()
{
  global $dp;
  $sql = "SELECT * FROM slideshow";
  $result = $dp->excuteQuery($sql);
  $slides = array();
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($slides, $row);
    }
  }
  return $slides;
}
function getPriceRange()
{
  global $dp;
  $sql = "SELECT MIN(gia) AS minPrice, MAX(gia) AS maxPrice FROM album WHERE trangThai = 1";
  $result = $dp->excuteQuery($sql);
  $priceRange = $result->fetch_assoc();
  return $priceRange;
}
?>