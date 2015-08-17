$(function() {
  addProgressBar = function() {
    checked = $('.discussion-timeline input:checkbox:checked.task-list-item-checkbox').length
    total = $('.discussion-timeline .task-list-item-checkbox').length
    progress = (checked / total) * 100.0
    bar =  '<div class="discussion-sidebar-item progress">'
    bar +=   '<h3 class="discussion-sidebar-heading">Progress</h3>'
    bar +=   '<span class="progress-bar">'
    bar +=     '<span class="progress" style="width: ' + progress + '%">'
    bar +=       '&nbsp;'
    bar +=     '</span>'
    bar +=   '</span>'
    bar +=   checked + '/' + total
    bar += '</div>'
    $('.discussion-sidebar').append(bar);
  }

  addDiffToggle = function() {
    toggle =  '<div class="discussion-sidebar-item toggle-outdated-diffs">';
    toggle +=   '<a href="#" class="show-outdated-diffs" style="color: #777; font-weight: bold;">';
    toggle +=     '<span class="octicon octicon-unfold"/>';
    toggle +=     ' Show outdated diffs';
    toggle +=   '</a>';
    toggle +=   '<a href="#" class="hide-outdated-diffs" style="display: none; font-weight: bold;">';
    toggle +=     '<span class="octicon octicon-fold"/>';
    toggle +=     ' Hide outdated diffs';
    toggle +=   '</a>';
    toggle += '</div>';
    $('.discussion-sidebar').append(toggle);
  }

  addDiffFromHereLinks = function() {
    var branch = $($('.commit-ref')[1]).text();
    $(".timeline-commits td.commit-message").each(function() {
      var commit = $('a', this).attr('href').match("\\w+$")[0];
      var link = '<a class="octicon octicon-diff" title="Diff from here" href="../compare/' + commit + "^..." + branch + '"></a>';
      $(this).append(link);
    });
  }

  if(document.URL.match(/\/pull\//)) {
    addProgressBar();
    addDiffToggle();
    addDiffFromHereLinks();
  }

  $('.toggle-outdated-diffs').on('click', '.show-outdated-diffs', function() {
    $('.outdated-diff-comment-container .discussion-item-body').show();
    $('.discussion-item-toggle-closed').hide();
    $('.discussion-item-toggle-open').show();
    $('.show-outdated-diffs').hide();
    $('.hide-outdated-diffs').show();
    return false;
  });

  $('.toggle-outdated-diffs').on('click', '.hide-outdated-diffs', function() {
    $('.outdated-diff-comment-container .discussion-item-body').hide();
    $('.discussion-item-toggle-closed').show();
    $('.discussion-item-toggle-open').hide();
    $('.hide-outdated-diffs').hide();
    $('.show-outdated-diffs').show();
    return false;
  });

  ////$(document).on('pjax:click', function() {
  //$(window).on("pageshow pjax:end", function() {
      ////alert("complete win");
  //});
  //$("[data-pjax-container]").on("change", function() {
      ////alert("complete cont change");
  //});
  //$(document).on('change', function() {
    ////alert("complete doc change");
  //});
});

