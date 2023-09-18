$(() => {

  const body = $("div.search-body");

  const searchbtn = $("input.search-button");

  searchbtn.click(() => {
    const textValue = $("input.search-text").val();
    const selectValue = $("select.dropdown").val();

    $.ajax({
      url    : "/back/search",
      method : "get",
      data   : {select: selectValue, text: textValue},
      success: (resultData) => {
        if (resultData.length != 0) {
          const resultlength = resultData.length;

          body.load("./search.html", () => {
            const viewtable = $("table.writing-list");

            for (var i = 0; i < resultlength; i++) {
              const tabletr = document.createElement("tr");
              tabletr.setAttribute("class", `num ${resultData[i].postnum}`);
              tabletr.innerHTML = `
                  <td>
                    <a>
                      <img src="${resultData[i].mainTitleImg}" alt="제목이미지" 
                                style="display: block; width: 200px; height: 150px;">
                    </a>
                  </td>
                  <td class="test">
                    <h2>${resultData[i].mainTitle} -</h2>
                    <h3>${resultData[i].name}</h3>
                    <p>${resultData[i].content}</p>
                  </td>`;

              $(viewtable).append(tabletr);
            }
          });
        } else {
          alert("검색하는 결과가 없습니다.");
        }
      },
      error  : function () {
        alert("검색 실패");
      },
    });
  });
  //검색버튼을 클릭하면 할 일 end

  //입력창에 엔터를 누르면 할 일 start
  const txtobj = $("input[type=text]");

  txtobj.keyup((e) => {
    if (e.key == "Enter") {
      //Enter에 입력하면 할 일

      this.alert("enter 입력");

      this.alert("enter입력");
    }
  });
  //입력창에 엔터를 누르면 할 일 start

  //카테고리 하나를 누르면 할 일 start
  const category = $(".category");

  category.click((e) => {
    //클릭한 카테고리 text를 가져온다.
    const categorieValue = $(e.target).text();
    alert(categorieValue);

    $.ajax({
      url    : "/back/category",
      method : "get",
      data   : {category: categorieValue},
      success: (categoryData) => {
        if (categoryData.length != 0) {
          const length = categoryData.length;

          body.load("./category.html", () => {
            const viewtable = $("table.writing-list");

            //어떤 카테고리를 선택했는지 해더 출력
            const categoryHeading = $("<h2>").html(
                "카테고리 -> " + categorieValue
            );
            categoryHeading.css({
              "margin-bottom": "30px",
              "font-weight"  : "bold",
              display        : "block",
            });
            viewtable.prepend(categoryHeading);

            for (var i = 0; i < length; i++) {
              const tableTr = document.createElement("tr");
              tableTr.innerHTML = `
              <td>
                  <a>
                    <img src="${categoryData[i].mainTitleImg}" alt="제목이미지" 
                              style="display: block; width: 200px; height: 150px;">
                  </a>
              </td>
              <td class="test">
                  <h2>${categoryData[i].mainTitle} -</h2>
                  <h3>${categoryData[i].name}</h3>
                  <p>${categoryData[i].content}</p>
              </td>`;

              //innerHTML로 작성한 tr -> table에 추가
              $(viewtable).append(tableTr);
            } //for end
          }); //load end
        } else {
          alert("해당카테고리의 글이 없습니다.");
        }
      }, //success end
      error  : function () {
        alert("잠시만 기다려주세요");
      },
    }); //ajax end
  }); //click event end
  //카테고리 하나를 누르면 할 일 end
}); //ready end
