<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form id="scheduleVO" name="scheduleVO" modelAttribute="scheduleVO" action="scheduelUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" accept-charset="utf-8">
    <form:hidden path="scheduleNo"/>
    <div class=" row align-items-center">
        <div class="form-group col-sm-12">
            <label for="auth">제목</label>
            <input type="text" class="form-control" name="scheduleTitle" value="${scheduleVO.scheduleTitle}">
        </div>
        <div class="form-group col-sm-12">
            <label for="createDate">시작날짜</label>
            <input type="date" class="form-control" name="startDate" value="<fmt:formatDate value="${scheduleVO.startDate}" pattern="yyyy-MM-dd" />">
        </div>
        <div class="form-group col-sm-12">
            <label for="createDate">종료날짜</label>
            <input type="date" class="form-control" name="endDate" value="<fmt:formatDate value="${scheduleVO.endDate}" pattern="yyyy-MM-dd" />">
        </div>
        <div class="form-group col-sm-12">
            <label>행사항목</label>
            <form:select path="scheduleCategory" cssClass="custom-select">
                <form:option value="D101">정기행사일정</form:option>
                <form:option value="D102">교내 행사</form:option>
                <form:option value="D103">학부모 참관일</form:option>
                <form:option value="D104">생일</form:option>
            </form:select>
        </div>
        <div class="form-group col-sm-12 input-group  mb-4">
            <label>공지사항</label>
            <input type="hidden" class="form-control" name="noticeNo" id="noticeNo" value="${scheduleVO.noticeNo}">
            <div class="input-group mb-4">
                <input type="text" class="form-control" placeholder="공지사항 제목을 입력해주세요." aria-label="Recipient's username"
                       id="noticeSearch" value="${scheduleVO.noticeTitle}">
                <div class="input-group-prepend show noticeBox">
                </div>
                <div class="input-group-append">
                    <span class="input-group-text" id="inputGroup-sizing-default">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close" id="btn-clear">
                            <i class="ri-close-line"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>

    </div>
</form:form>
<script>
    $('[name="scheduleInsertForm"]').on("submit", function (event) {
        event.preventDefault();

        let title = $('[name="scheduleTitle"]');
        if (title.val() == '') {
            alert("제목이 입력되지 않았습니다.");
            title.focus();
            return;
        }
        //let a = document.getElementById('category').value;
        let category = $('select[name="scheduleCategory"]').val();

        alert('게시글이 등록되었습니다.');
        scheduleInsertForm.submit();
    });

    function fn_selectNotice(t) {
        var noticeNo = $(t).attr("data-notice-no");
        var noticeTitle = $(t).html();
        $("#noticeSearch").val(noticeTitle);
        $("#noticeNo").val(noticeNo);
        $(".noticeBox").html("");

    }

    var noticeList = ${noticeList};

    function findMatches(wordToMatch) {
        return noticeList.filter(notice => {
            const regex = new RegExp(wordToMatch, 'gi');
            return notice.noticeTitle.match(regex)
        });
    }

    function displayInputValue() {
        var keyword = $("#noticeSearch").val();
        if (keyword === "") {
            $(".noticeBox").html("");
            return;
        }
        const resultArr = findMatches(keyword);
        var tb = $('<div class="dropdown-menu show noticeTitleBox" style="position: absolute;transform: translate3d(0px, 50px, 0px);top: 0px;left: 0px;will-change: transform;display: flex;flex-wrap: wrap;align-items: stretch;width: 100%;" x-placement="bottom-start"></div>');
        if (resultArr.length == 0) {
            var $li = $('<a href="javascript:fn_noticeSelect(this);" class="dropdown-item">' + '검색된 내용이 없습니다.' + '</a>')
            $(tb).append($li);
        }
        resultArr.forEach((el, idx) => {
            var noticeTitle = el.noticeTitle;
            var noticeNo = el.noticeNo;
            var $li = $('<a href="#" class="dropdown-item" onclick="fn_selectNotice(this);" data-notice-no="' + noticeNo + '" >' + noticeTitle + '</a>')
            $(tb).append($li);
        })
        $(".noticeBox").html(tb);
    }

    $(function () {
        $('[id="noticeSearch"]').on("focusout", function (event) {
            event.preventDefault();
            console.log("df");
        });
        $('[id="noticeSearch"]').on("focusin click change keyup", function (event) {
            event.preventDefault();
            displayInputValue();
        });
        $('[id="btn-clear"]').on("click", function (event) {
            event.preventDefault();
            $("#noticeSearch").val("");
            $("#noticeNo").val("");
            displayInputValue();

        });
    })
</script>

