<?php
session_start();
require("../../../util/dataProvider.php");
$dp = new DataProvider();
//handle content album
$albumID = $_POST["albumID"];
// $sql = "SELECT * FROM album where maAlbum = " . $albumID;
// $result = $dp->excuteQuery($sql);
$sql = "SELECT album.*, theloai.tenLoai 
        FROM album 
        JOIN theloai ON album.theLoai = theloai.maLoai 
        WHERE maAlbum = " . $albumID;
$result = $dp->excuteQuery($sql);
$album = $result->fetch_assoc();
$category = $album['theLoai'];

//handle album's song
$sql = "SELECT * FROM baihat_album join baihat on baihat_album.BaiHat_maBaiHat = baihat.maBaiHat
where Album_maAlbum = " . $albumID;
$result = $dp->excuteQuery($sql);
$songs = array();
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    array_push($songs, $row); 
  }
}
?>
<div id="detail-album">
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
</div>

<div id="product-details">
  <div class="left">
    <img src="data/imgAlbum/<?= $album["hinh"] ?>" alt="hinh" />
    <!-- <img src=< php echo "data/imgAlbum/" . $album["hinh"] ?> alt="hinh"> -->
  </div>
  <div class="right">
    <p class="title">
      <?php echo $album["tenAlbum"] ?>
    </p>

    <p class="sub-title">
      <?php echo $album['tacGia'] ?>
    </p>
    <br>
    <p class="sub-title">
      <?php echo $album['tenLoai'] ?>
    </p>
    <p class="description">
      <?php echo $album["moTa"] ?>
    </p>
    <h2 class="price">
      <?php echo "$" . number_format((float) $album["gia"], 2, '.', '') ?>
    </h2>
    <div class="control">
      <div class="btn back-btn" onclick="closeDetailProductInHome();">
        <i class="fa-solid fa-arrow-left"></i>
        <span>Back</span>
      </div>
      <div class="btn add-to-cart-btn" onclick="addToCart(<?php echo $album['maAlbum'] ?>)">
        <i class="fa-regular fa-cart-shopping"></i>
        <span>Add to cart</span>
      </div>
      <?php if (isset($_SESSION['userID']) && $dp->isFavorite($albumID, $_SESSION['userID'])): ?>
        <div class="btn favorite-btn" onclick="disLike(<?php echo $album['maAlbum'] ?>)">
          <i class="fa-solid fa-heart-circle-xmark"></i>
          <span>Disliked</span>
        </div>
      <?php else: ?>
        <div class="btn favorite-btn" onclick="addToFavorite(<?php echo $album['maAlbum'] ?>)">
          <i class="fa-solid fa-heart"></i>
          <span>Favourite</span>
        </div>
      <?php endif ?>
    </div>
    <h1 class="title">Track list <i class="fa-regular fa-circle-play"
        onclick="playTrackList(<?php echo $album['maAlbum'] ?>)"></i></h1>
    <div class="songs-container">
      <?php
      for ($i = 0; $i < count($songs); $i++) {
        echo '<p>' . ($i + 1) . ". " . $songs[$i]['tenBaiHat'] . '</p>';
      }
      ?>

    </div>
  </div>
</div>