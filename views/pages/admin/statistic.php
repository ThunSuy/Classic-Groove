<div id="statistic">
    <h2> <i class="fa-solid fa-chart-column"></i><span>Statistic</span></h2>

    <div id="statistic-type4">
        <input type="date" class="dateStart" value="<?= date("Y") . "-01-01" ?>">
        <input type="date" class="dateEnd" value="<?= date("Y-m-d") ?>">
        <Button value="" onclick="statistic4()">Statistic</Button>
        <figure class="highcharts-figure">
            <div id="container4"></div>
        </figure>
    </div>

    <br>
    <h2> <i class="fa-solid fa-chart-column"></i><span>Detail</span></h2>
    <br>
    <br>
    <div id="orderManager">
    <div class="title-list">
        <div class="title-placeholder">
            <div class="title" style="padding-right: 10px;">No.</div>
            <div class="title" style="padding-right: 15px;">Order ID</div>
            <div class="title" style="padding-right: 15px;">Account ID</div>
            <div class="title" style="padding-right: 10px;">Date of order</div>
            <div class="title" style="padding-right: 10px;">Total price</div>
            <div class="title" style="padding-right: 10px;">Payment</div>
            <div class="title" style="padding-right: 10px;">Status</div>
            <div class="title"></div>
        </div>
    </div>
    <div class="list">
        
    </div>
    <div id="modal-box"></div>
</div>

    <!-- <div id="statistic-type1">
        <input type="month" class="dateStart" value="<?= date("Y") . "-01" ?>">
        <input type="month" class="dateEnd" value=<?= date("Y-m") ?>>
        <select name="" id="" class="typeStatictis" onchange="changeTypeInputDate()">
            <option value="2">By month</option>
            <option value="1">By year</option>
            <option value="3">By week</option>
            <option value="4">By date</option>
        </select>
        <Button value="" onclick=" statistic1()">Statistic</Button>

        <figure class="highcharts-figure">
            <div id="container"></div>
        </figure>
    </div>
    <div id="statistic-type2">
        <input type="date" class="dateStart" value="<?= date("Y") . "-01-01" ?>">
        <input type="date" class="dateEnd" value=<?= date("Y-m-d") ?>>
        <select name="" id="" class="typeStatictis">
            <option value="1">Type Products</option>
            <option value="2">Products</option>
        </select>
        <Button value="" onclick=" statistic2()">Statistic</Button>
        <figure class="highcharts-figure">
            <div id="container2"></div>
        </figure>
    </div>
    <div id="statistic-type3">
        <input type="date" class="dateStart" value="<?= date("Y") . "-01-01" ?>">
        <input type="date" class="dateEnd" value=<?= date("Y-m-d") ?>>
        <select name="" id="" class="typeStatictis">
            <option value="1">Type Products</option>
            <option value="2">Products</option>
        </select>
        <input type="text" placeholder="Limit" class="limit" value="3">
        <Button value="" onclick=" statistic3()">Statistic</Button>
        <figure class="highcharts-figure">
            <div id="container3"></div>
        </figure>
    </div> -->
</div>