<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PET KCC</title>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../../resources/common/common.js" type="text/javascript"></script>
    <link rel="icon" href="../../resources/images/spring-logo.ico" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" type="text/css" href="../../resources/common/common.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/main.css" />
  </head>
  <body>

    <%@ include file="../../resources/common/header.jsp" %>

    <section class="d-flex flex-column align-items-center min-vh-100">
      <div class="container custom-container">
        <section class="row search-bar">
          <div class="row">
            <div class="col-md-6 offset-md-3">
              <div class="input-group mb-1 search-bar">
                <span class="input-group-text">
                  <img
                    src="../../resources/images/zoom-icon.png"
                    alt="Search Icon"
                    style="width: 30px; height: 30px"
                  />
                </span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="찾고 싶은 모임을 검색하세요"
                />
              </div>
            </div>
          </div>
        </section>
        <div class="mb-4" id="meetup">모임</div>
        <section class="container">
          <div class="row">
            <div class="col-lg-4 col-md-6 card cus_card-card">
              <div class="card-body">
                <h5 class="card-title cus_card-title">대형견</h5>
                <br />
                <h6 class="card-subtitle mb-2 text-muted cus_card-subtitle">
                  흑석동 귀여운 강아지 동호회
                </h6>
                <p class="card-text cus_card-text mb-5">
                  안녕하세요. 흑석동 돼강동 입니다. 저희 함께 놀아요~
                </p>
                <br />
                <a href="#" class="btn cus_card-btn">참여하기</a>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 card cus_card-card">
              <div class="card-body">
                <h5 class="card-title cus_card-title">대형견</h5>
                <br />
                <h6 class="card-subtitle mb-2 text-muted cus_card-subtitle">
                  흑석동 귀여운 강아지 동호회
                </h6>
                <p class="card-text cus_card-text mb-5">
                  안녕하세요. 흑석동 돼강동 입니다. 저희 함께 놀아요~
                </p>
                <br />
                <a href="#" class="btn cus_card-btn">참여하기</a>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 card cus_card-card">
              <div class="card-body">
                <h5 class="card-title cus_card-title">대형견</h5>
                <br />
                <h6 class="card-subtitle mb-2 text-muted cus_card-subtitle">
                  흑석동 귀여운 강아지 동호회
                </h6>
                <p class="card-text cus_card-text mb-5">
                  안녕하세요. 흑석동 돼강동 입니다. 저희 함께 놀아요~
                </p>
                <br />
                <a href="#" class="btn cus_card-btn">참여하기</a>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 card cus_card-card">
              <div class="card-body">
                <h5 class="card-title cus_card-title">대형견</h5>
                <br />
                <h6 class="card-subtitle mb-2 text-muted cus_card-subtitle">
                  흑석동 귀여운 강아지 동호회
                </h6>
                <p class="card-text cus_card-text mb-5">
                  안녕하세요. 흑석동 돼강동 입니다. 저희 함께 놀아요~
                </p>
                <br />
                <a href="#" class="btn cus_card-btn">참여하기</a>
              </div>
            </div>
          </div>

          <br />

          <nav
            class="d-flex justify-content-center"
            aria-label="Page navigation example"
          >
            <ul class="pagination">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true"
                  >이전</a
                >
              </li>
              <li class="page-item active">
                <a class="page-link" href="#">1</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">다음</a></li>
            </ul>
          </nav>
        </section>
      </div>
    </section>

    <%@ include file="../../resources/common/footer.jsp" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
