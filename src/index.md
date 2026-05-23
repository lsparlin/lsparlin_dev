---
layout: default
title: Index
page_class: home
---

<section class="landing" aria-labelledby="intro-title">
  <p class="prompt">~/lsparlin.dev</p>

  <h1 id="intro-title">Lewis M Sparlin</h1>
  <p class="role">Software Developer and Consultant</p>

  <div class="intro-copy">
    <p>Hey, I’m Lewis.</p>
    <p>I make things with software.</p>
    <p>I enjoy spending my time with family, brewing excellent coffee, and helping teams build quality software.</p>
  </div>

  <ul class="link-list" aria-label="Contact links">
    <li><a href="mailto:<%= site.metadata.email %>">email</a></li>
    <li><a href="<%= site.metadata.social.github %>">github</a></li>
    <li><a rel="me" href="<%= site.metadata.social.mastodon %>">ruby.social</a></li>
    <!-- <li><a href="<%= relative_url '/posts/' %>">writing</a></li> -->
  </ul>
</section>
