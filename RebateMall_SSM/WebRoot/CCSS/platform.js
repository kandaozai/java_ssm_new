var tag_type_platform_bg = 1;
var tag_type_platform_tag = 2;
var tag_type_product_tag = 3;

var defaultCurrentPage = 1;
var defaultLength = 1;

/**
 * 显示产品1
 * @param id
 */
//产品块状列表
function loadProductListHot(contextPath, id, params, callback) {
    var url = contextPath + "/product/product_item_hot.htm";
    if (params == null) {
        params = {};
        params.start = 0;
        params.length = 8;
        //params.tagId = 33;
        var productTagIdList = new Array();
        productTagIdList.push(33);
        params.productTagIdList = productTagIdList;
    }
    if (params != null) {
        var tagid = params;

        params = {};
        params.start = 0;
        params.length = 8;
        var productTagIdList = new Array();
        productTagIdList.push(tagid);
        params.productTagIdList = productTagIdList;
    }

    $.ajax({
        url: url,
        data: JSON.stringify(params),
        method: "post",
        contentType: "application/json",
        dataType: "text",
        success: function (html) {
            $(id).html(html);
            return callback;
        }
    });
}

//产品条状列表
function loadProductListNewb(contextPath, id, params, callback) {
    var url = contextPath + "/product/product_item_new.htm";
    if (params == null) {
        params = {};
        params.start = 0;
        params.length = 5;
        var productTagIdList = new Array();
        productTagIdList.push(34);
        params.productTagIdList = productTagIdList;
    }
    if (params != null) {
        var tagid = params;

        params = {};
        params.start = 0;
        params.length = 5;
        var productTagIdList = new Array();
        productTagIdList.push(tagid);
        params.productTagIdList = productTagIdList;
    }

    $.ajax({
        url: url,
        data: JSON.stringify(params),
        method: "post",
        contentType: "application/json",
        dataType: "text",
        success: function (html) {
            $(id).html(html);
            return callback;
        }
    });
}








//分页产品列表
function loadProductList(contextPath, id, params, callback) {
    var url = contextPath + "/product/product_item.htm";
    if (params == null) {
        params = {};
        params.currentPage = defaultCurrentPage;
        params.length = defaultLength;
    }
    if (params != null) {
        if (params.currentPage == null) {
            params.currentPage = defaultCurrentPage;
        }
        if (params.length == null) {
            params.length = defaultLength;
        }
    }

    $.ajax({
        url: url,
        data: JSON.stringify(params),
        method: "post",
        contentType: "application/json",
        dataType: "text",
        success: function (html) {
            $(id).html(html);
            return callback;
        }
    });
}

//分页产品列表
function loadList(url, params, callback) {
    if (params == null) {
        params = {};
        params.currentPage = defaultCurrentPage;
        params.length = defaultLength;
    }
    if (params != null) {
        if (params.currentPage == null) {
            params.currentPage = defaultCurrentPage;
        }
        if (params.length == null) {
            params.length = defaultLength;
        }
    }

    $.ajax({
        url: url,
        data: params,
        method: "post",
        dataType: "json",
        success: function (data) {
            return callback(data);
        }
    });
}

//平台详情最新产品列表
function loadplaProductList(contextPath, id, params, callback) {
    var url = contextPath + "/product/product_item_cs.htm";
    if (params == null) {
        params = {};
        params.currentPage = defaultCurrentPage;
        params.length = defaultLength;
    }
    if (params != null) {
        if (params.currentPage == null) {
            params.currentPage = defaultCurrentPage;
        }
        if (params.length == null) {
            params.length = defaultLength;
        }
    }

    $.ajax({
        url: url,
        data: JSON.stringify(params),
        method: "post",
        contentType: "application/json",
        dataType: "text",
        success: function (html) {
            $(id).html(html);
            return callback;
        }
    });
}


/**
 * 显示平台
 * @param id
 */
function loadPlatformList(contextPath, id, params, callback) {
    var url = contextPath + "/platform/platform_query_list.htm";
    if (params == null) {
        params = {};
        params.start = 0;
        params.length = 6;
        params.collaborate = 1;
        params.state = 1;
    }
    if (params != null) {
        var tagid = params;

        params = {};
        params.start = 0;
        params.length = 6;
        var platformBgIdList = new Array();
        platformBgIdList.push(tagid);
        params.platformBgIdList = platformBgIdList;
        params.collaborate = 1;
        params.state = 1;
    }
    $.ajax({
        url: url,
        data: params,
        method: "get",
        traditional: true,
        dataType: "text",
        success: function (html) {
            $(id).html(html);
            return callback;
        }
    });
}

/**
 * 显示相似平台
 * @param id
 */
/*function loadxsPlatformList(contextPath,id,params,callback) {
 var url = contextPath + "/platform/platform_query_list_cs.htm";
 $.ajax({
 url:url,
 data:params,
 method:"get",
 dataType:"text",
 success:function(html){
 $(id).html(html);
 return callback;
 }
 });
 }*/
/**
 * 显示平台排行
 * @param id
 */
/*function loadphPlatformList(contextPath,id,params,callback) {
 var url = contextPath + "/platform/platform_query_list_cs.htm";
 $.ajax({
 url:url,
 data:params,
 method:"get",
 dataType:"text",
 success:function(html){
 $(id).html(html);
 return callback;
 }
 });
 }*/
/**
 * 获得平台背景
 * @param contextPath
 */
function loadPlatformBgList(contextPath, tagType, relationId, callback) {
    var url = contextPath + "/tag/queryTagList";
    var params = {};
    params.tagType = tagType;
    params.relationId = relationId;
    $.getJSON(url, params, function (result) {
        callback(result);
    });
}


/**
 * ajax请求
 * @param contextPath
 * @param url
 * @param params
 * @param callback
 */
function load(url, params, callback) {
    $.ajax({
        url: url,
        data: JSON.stringify(params),
        method: "post",
        contentType: "application/json",
        dataType: "json",
        success: function (result) {
            return callback(result);
        }
    });
}


function loadText(url, params, callback) {
    $.ajax({
        url: url,
        data: JSON.stringify(params),
        method: "post",
        contentType: "application/json",
        dataType: "text",
        success: function (result) {
            return callback(result);
        }
    });
}
/**
 * 初始化分页
 * @param params
 * @param id
 */
function initSearch(contextPath, params, listId, pageId) {
    params.currentPage = 1;
    params.collaborate = 1;
    load(contextPath + "/product/product_query_total", params, function (result) {
        console.log(result);
        var page = result.data;

        if (page.totalPage == 0) {
            $(pageId).html("没有数据");
            loadProductList(contextPath, listId, params);
            return;
        }

        $(pageId).paginate({
            count: page.totalPage,//总页数
            start: page.currentPage,//当前多少页
            display: "5", //显示分页多少条记录
            border: false,
            text_color: '#888',
            background_color: '#EEE',
            text_hover_color: 'black',
            background_hover_color: '#CFCFCF',
            onChange: function (clickPage) {
                params.currentPage = clickPage;
                loadProductList(contextPath, listId, params)
            }
        });
        loadProductList(contextPath, listId, params)
    })
}
/**
 * 平台详情初始化分页
 * @param params
 * @param id
 */
function loadTextModel(url, params, listId) {
    if (params == null) {
        params = {};
        params.currentPage = 1;
        params.length = 5;
    }
    if (params != null) {
        params.currentPage = 1;
    }
    loadText(url, params, function (result) {
        $(listId).html(result);
    })
}
/**
 * 数据分页
 * @param params
 * @param id
 */
function initBind(url, params, pageId, callback) {
    params.currentPage = 1;
    $.getJSON(url, params, function (result) {
        var page = result.data;
        if (page.totalPage == 0 || page.totalPage == null) {
            $(pageId).html("没有数据");
            loadList(url, params, callback);
            return;
        }

        $(pageId).paginate({
            count: page.totalPage,//总页数
            start: page.currentPage,//当前多少页
            display: "5", //显示分页多少条记录
            border: false,
            text_color: '#888',
            background_color: '#EEE',
            text_hover_color: 'black',
            background_hover_color: '#CFCFCF',
            onChange: function (clickPage) {
                params.currentPage = clickPage;
                loadList(url, params, callback);
            }
        });
        loadList(url, params, callback);
    })

    //分页平台列表
    function loadPlatformList(contextPath, id, params, callback) {
        var url = contextPath;
        if (params == null) {
            params = {};
            params.currentPage = defaultCurrentPage;
            params.length = defaultLength;
        }
        if (params != null) {
            if (params.currentPage == null) {
                params.currentPage = defaultCurrentPage;
            }
            if (params.length == null) {
                params.length = defaultLength;
            }
        }

        $.ajax({
            url: url,
            data: JSON.stringify(params),
            method: "post",
            contentType: "application/json",
            dataType: "text",
            success: function (html) {
                $(id).html(html);
                return callback;
            }
        });
    }



}
function initBind2(url, params, pageId, callback) {
    params.currentPage = 1;
    $.getJSON(url, params, function (result) {
        var page = result.data.data;

        if (page.totalPage == 0 || page.totalPage == null) {
            $(pageId).html("没有数据");
            loadList(url, params, callback);
            return;
        }

        $(pageId).paginate({
            count: page.totalPage,//总页数
            start: page.currentPage,//当前多少页
            display: "5", //显示分页多少条记录
            border: false,
            text_color: '#888',
            background_color: '#EEE',
            text_hover_color: 'black',
            background_hover_color: '#CFCFCF',
            onChange: function (clickPage) {
                params.currentPage = clickPage;
                loadList(url, params, callback);
            }
        });
        loadList(url, params, callback);
    })

}