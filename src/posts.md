---
layout: page
title: Writing
page_class: writing
---

<p class="lede">A place for short notes, project updates, and longer-form thinking. The first version is intentionally light; add posts in <code>src/_posts</code> when you’re ready.</p>

<div class="post-list">
  <% collections.posts.resources.each do |post| %>
    <article class="post-card">
      <time datetime="<%= post.date.strftime('%Y-%m-%d') %>"><%= post.date.strftime('%B %-d, %Y') %></time>
      <h2><a href="<%= post.relative_url %>"><%= post.data.title %></a></h2>
      <% if post.data.description %><p><%= post.data.description %></p><% end %>
    </article>
  <% end %>
</div>
