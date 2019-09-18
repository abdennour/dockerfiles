name: inverse
layout: true
class: center, middle, inverse
---

# Presentation Title
## Presentation subtitle


Presentation short description with some overview

---
name: agenda
layout: false

# Agenda


## 1. Getting started with Remark in Docker
--

## 2. Remark up & running
--

## 3. Sample

--
## 4. Conculsion



---
name: intro-1

## 1. Getting started with Remark in Docker

Remark is a simple, in-browser, markdown-driven slideshow tool targeted at people who know their way around HTML and CSS, featuring.



---

## 2. Remark up & running

Docker compose

```yaml
version: '3.7'

services:
  presentation:
    image: abdennour/remark:0.14.0-nginx-1.17-alpine
    ports:
    - 8080:80
    volumes:
    - ./myslides.md:/usr/share/nginx/html/slides.md
```

---
template: inverse

## It's time to get started!
---
.left-column[
   ## 3. Sample
]
.right-column[
```yaml
version: '3.7'

services:
  presentation:
    image: abdennour/remark:0.14.0-nginx-1.17-alpine
    ports:
    - 8080:80
    volumes:
    - ./myslides.md:/usr/share/nginx/html/slides.md
```

]
---
name: last-page
template: inverse

## That's all folks (for now)!