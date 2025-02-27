$(document).ready(function () {
    // Hàm tải sản phẩm
    function loadProducts(index) {
        let search = $("#searchInput").val().trim().toLowerCase();
        let type = $("input[name='type']:checked").val() || ""; // Default to empty string if no type is selected
        let brand = $("input[name='brand']:checked").val() || ""; // Default to empty string if no brand is selected
        let gender = $("input[name='productType']:checked").val() || ""; // Default to empty string if no gender is selected
        let sort = $("#sortSelect").val() || "";

        console.log("Loading products with params - Index: " + index + ", Search: " + search + ", Type: " + (type || 'undefined') + ", Brand: " + (brand || 'undefined') + ", Gender: " + (gender || 'undefined') + ", Sort: " + (sort || 'null'));

        $.ajax({
            url: "/ClothingShop/products",
            type: "GET",
            data: {
                index: index,
                search: search,
                type: type, // Ensure this is sent as a string (e.g., "1", "6", or "")
                brand: brand, // Ensure this is sent exactly as in the database
                gender: gender,
                sort: sort
            },
            success: function (data) {
                let htmlContent = data.split("<!--JSON_START-->")[0];
                let jsonData = JSON.parse(data.split("<!--JSON_START-->")[1].split("<!--JSON_END-->")[0]);

                $("#productContainer").html(htmlContent);
                updatePagination(jsonData.currentPage, jsonData.endPage);
                updateSortSelect(sort);
            },
            error: function (xhr, status, error) {
                console.error("Lỗi:", status, error);
                $("#productContainer").html("<p class='text-danger'>Đã xảy ra lỗi khi tải sản phẩm.</p>");
            }
        });
    }

    // Hàm cập nhật phân trang
    function updatePagination(currentPage, endPage) {
        let paginationHtml = "";
        if (currentPage > 1) {
            paginationHtml += `<li class="page-item"><a class="page-link" href="products?index=${currentPage - 1}"><</a></li>`;
        }
        for (let i = 1; i <= endPage; i++) {
            paginationHtml += `<li class="page-item ${currentPage == i ? 'active' : ''}"><a class="page-link" href="products?index=${i}">${i}</a></li>`;
        }
        if (currentPage < endPage) {
            paginationHtml += `<li class="page-item"><a class="page-link" href="products?index=${currentPage + 1}">></a></li>`;
        }
        $(".pagination").html(paginationHtml);
    }

    // Hàm cập nhật trạng thái Sort Select
    function updateSortSelect(currentSort) {
        $("#sortSelect").prop("disabled", false); // Luôn cho phép chọn lại
    }

    // Sự kiện thay đổi search
    $("#searchInput").on("input", function () {
        loadProducts(1);
    });

    // Sự kiện mất focus của search
    $("#searchInput").on("blur", function () {
        if ($(this).val().trim() === "") {
            $(this).val("");
            loadProducts(1);
        }
    });

    // Sự kiện thay đổi filter (type, brand, gender) using event delegation
    $(document).on("change", "input[name='type'], input[name='brand'], input[name='productType']", function () {
        let type = $("input[name='type']:checked").val() || "";
        let brand = $("input[name='brand']:checked").val() || "";
        let gender = $("input[name='productType']:checked").val() || "";

        // Debug each input to ensure they are selected correctly
        console.log("Filter changed - Type Input: ", $("input[name='type']:checked"));
        console.log("Filter changed - Type Value: " + (type || 'undefined'));
        console.log("Filter changed - Brand Input: ", $("input[name='brand']:checked"));
        console.log("Filter changed - Brand Value: " + (brand || 'undefined'));
        console.log("Filter changed - Gender Input: ", $("input[name='productType']:checked"));
        console.log("Filter changed - Gender Value: " + (gender || 'undefined'));

        loadProducts(1);
    });

    // Sự kiện thay đổi sort
    $("#sortSelect").on("change", function () {
        loadProducts(1);
    });

    // Sự kiện thay đổi phân trang
    $(document).on("click", ".page-link", function (e) {
        e.preventDefault();
        if (!$(this).parent().hasClass("active")) {
            let index = $(this).attr("href").split("index=")[1];
            loadProducts(index);
        }
    });

    // Tải sản phẩm lần đầu
    loadProducts(1);
});