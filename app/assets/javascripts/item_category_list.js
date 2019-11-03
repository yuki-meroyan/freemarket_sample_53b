$(function(){
  // *** カテゴリーの変数を定義 ***
  var categoryList;

  // *** ready 着火 セット ***
  $(document).ready(function(){
  //--- 読み込まれたタイミングでカテゴリー情報を取得    
    $.ajax({
      type: 'GET',
      url: `/categories`,
      data: {keyword: "all"},
      dataType: 'json'
    })
    .done(function(categories) {  
      categoryLists = categories
    })
  });         
  // *** ready 着火 セット の終わり ***

  $('.shared-header__nav').on('mouseenter', '#nav-category', function(){ 
    //--- 親リストを取得
    var parentLists = $.grep(categoryLists,
      function(category, index) {
        return (category.ancestry == null );
      }
    );
    $('.nav__category__parent').css('display', 'flex'); 
    if (parentLists.length !== 0) {
      var insertHTML = "";
      $('.nav__category__grandchild__list').empty();
      $('.nav__category__grandchild').css('display', 'none');
      parentLists.forEach(function(parent){
        var insertHTML = `<div class="parent-list" data-category-id=${parent.id} data-position="parent">
                            <li>
                              <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
                                <p>${parent.category}</p>
                              </a>
                            </li>
                            </div>`
        $('.nav__category__parent__list').append(insertHTML);
      });   //--- parentLists.forEach の終わり
    }       //--- if parentLists.length !== 0 の終わり
  });       //--- mouseenter/nav-category の終わり

  // *** 親⇨子 セット ***
  $('.nav__category').on('mouseenter', '.parent-list', function(){
    var parent_id = $(this).data('category-id');
    //--- 子リストを取得
    var childLists = $.grep(categoryLists,
      function(category, index) {
        return (category.ancestry == parent_id);
      }
    );
    if (childLists.length !== 0) {
      var insertHTML = "";
      $('.nav__category__child').css('display', 'flex'); 
      $('.nav__category__child__list').empty();
      $('.nav__category__grandchild__list').empty();
      $('.nav__category__grandchild').css('display', 'none');
      childLists.forEach(function(child){
        var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id} data-position="child">
                            <li>
                              <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
                                <p>${child.category}</p>
                              </a>
                            </li>
                          </div>`
        $('.nav__category__child__list').append(insertHTML);
      });   //--- childs.forEachの終わり
    }       //--- if childs.length !== 0 の終わり
  });       //--- mouseenter/parent-list の終わり
  $('.nav__category__parent').hover(
    function() {
      $('.nav__category').on('mouseover', '.parent-list', function(){
        $('.parent-list').removeClass('nav__category__parent__active');
        $(this).addClass("nav__category__parent__active");
      })
    }
  )
  // *** 親⇨子 セット の終わり ***

  // *** 子⇨孫 セット ***
  $('.nav__category').on('mouseenter', '.child-list', function(){
    var child_id = $(this).data('category-id');
    //--- 孫リストを取得
    var grandchildLists = $.grep(categoryLists,
      function(category, index) {
        return (category.ancestry == child_id);
      }
    );
    if (grandchildLists.length !== 0) {
      var insertHTML = "";
      $('.nav__category__grandchild').css('display', 'flex'); 
      $('.nav__category__grandchild__list').empty();
      grandchildLists.forEach(function(grandchild){
        var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id} data-position="grandchild">
                            <li>
                              <a class="category__main__grandchild__link-name" href="/categories/${grandchild.id}">
                                <p>${grandchild.category}</p>
                              </a>
                            </li>
                          </div>`
        $('.nav__category__grandchild__list').append(insertHTML);
      });     //--- grandchilds.forEachの終わり
    }         //--- if grandchilds.length !== 0 の終わり
  })          //--- mouseenter/child-list の終わり
  $('.nav__category__child').hover(
    function() {
      $('.nav__category').on('mouseover', '.child-list', function(){
        $('.child-list').removeClass('nav__category__child__active');
        $(this).addClass("nav__category__child__active");
      })
    },
  );
  // *** 子⇨孫 セット の終わり ***

  // *** 孫 セット ***
  $('.nav__category__grandchild').hover(
    function() {
      $('.nav__category').on('mouseover', '.grandchild-list', function(){
        $('.grandchild-list').removeClass('nav__category__grandchild__active');
        $(this).addClass("nav__category__grandchild__active");
      })
    },
  );
  // *** 孫 セット の終わり *** 

  // *** リセット セット *** 
  $('#nav-category').on('mouseleave', function(){
    $('.nav__category__parent__list').empty();
    $('.nav__category__parent').css('display', 'none'); 
    $('.nav__category__child__list').empty();
    $('.nav__category__child').css('display', 'none'); 
    $('.nav__category__grandchild__list').empty();
    $('.nav__category__grandchild').css('display', 'none'); 
  })
  // *** リセット セット の終わり *** 

  // *** 再びカテゴリーを探すを選択された場合のみ子リストをリセット ***
  $('.nav__left__link').on('mouseover', function(){
    $('.nav__category__child__list').empty();
    $('.nav__category__child').css('display', 'none'); 
  })
});  //--- functionの終わり