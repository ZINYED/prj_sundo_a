<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
</style>

<div class="flex-shrink-0 p-3">
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#mypost-collapse" aria-expanded="true">
		사용자 관리
        </button>
        <div class="collapse show" id="mypost-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="/admin_userinfo_list" class="link-body-emphasis d-inline-flex text-decoration-none rounded">사용자 관리</a></li>
            <li><a href="/admin_org_list" class="link-body-emphasis d-inline-flex text-decoration-none rounded">기관 관리</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#mypost-collapse" aria-expanded="true">
		운영 관리
        </button>
        <div class="collapse show" id="mypost-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="/admin_notice_list" class="link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#mypost-collapse" aria-expanded="true">
		시스템 관리
        </button>
        <div class="collapse show" id="mypost-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
            <li><a href="/system_log" class="link-body-emphasis d-inline-flex text-decoration-none rounded">접속 통계</a></li>
            <li><a href="/access_log" class="link-body-emphasis d-inline-flex text-decoration-none rounded">접속 이력</a></li>
            <li><a href="/login_log" class="link-body-emphasis d-inline-flex text-decoration-none rounded">로그인 이력</a></li>
          </ul>
        </div>
      </li>

    </ul>
  </div>