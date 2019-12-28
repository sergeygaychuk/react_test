

# Group Articles


## Articles [/articles]


### Get article [GET /articles/{id}]

+ Parameters
    + id: `1` (number, required) - article id

+ Request returns article
**GET**&nbsp;&nbsp;`/articles/1`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "article": {
                "id": 1,
                "name": "Test article 1",
                "content": "Test content 1",
                "story_id": 1,
                "created_at": "2019-12-23T05:37:47.534Z",
                "updated_at": "2019-12-23T05:37:47.534Z",
                "source": "tweet"
              }
            }

+ Request returns empty response
**GET**&nbsp;&nbsp;`/articles/15`

    + Headers



+ Response 500

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Article with 'id'=15"
            }

### Create article [POST /articles]

+ Parameters
    + name: `test` (string, required) - article name
    + story_id: `1` (number, required) - story id that article belongs to
    + content: `test` (text, required) - article content
    + source: `facebook` (enum, required) - article source, possible values ['blog', 'facebook', 'tweet', 'other']

+ Request creates article
**POST**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+2&article%5Bname%5D=Test+article+2&article%5Bsource%5D=tweet&article%5Bstory_id%5D=2

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
            
              ]
            }

+ Request returns errors if validations fails (missing name
**POST**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+3&article%5Bsource%5D=facebook&article%5Bstory_id%5D=3

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name can't be blank"
              ]
            }

+ Request returns errors if validations fails (missing story_id
**POST**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+4&article%5Bname%5D=Test+article+4&article%5Bsource%5D=facebook

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Story must exist",
                "Story can't be blank"
              ]
            }

+ Request returns errors if validations fails (missing content
**POST**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bname%5D=Test+article+5&article%5Bsource%5D=facebook&article%5Bstory_id%5D=5

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Content can't be blank"
              ]
            }

+ Request returns errors if validations fails (missing source
**POST**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+6&article%5Bname%5D=Test+article+6&article%5Bstory_id%5D=6

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Source can't be blank"
              ]
            }

### Destroy article [DELETE /articles/{id}]

+ Parameters
    + id: `1` (number, required) - article id

+ Request returns article
**DELETE**&nbsp;&nbsp;`/articles/3`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

### Update article [PUT /articles/{id}]

+ Parameters
    + name: `test` (string, required) - article name
    + story_id: `1` (number, required) - story id that article belongs to
    + content: `test` (text, required) - article content
    + source: `facebook` (enum, required) - article source, possible values ['blog', 'facebook', 'tweet', 'other']

+ Request updates article
**PUT**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+8&article%5Bname%5D=Test+article+8&article%5Bsource%5D=tweet&article%5Bstory_id%5D=8&id=4

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
            
              ]
            }

+ Request returns errors if validations fails (missing name
**PUT**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+9&article%5Bname%5D=&article%5Bsource%5D=blog&article%5Bstory_id%5D=9&id=6

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name can't be blank"
              ]
            }

+ Request returns errors if validations fails (missing story_id
**PUT**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+10&article%5Bname%5D=Test+article+10&article%5Bsource%5D=tweet&article%5Bstory_id%5D=&id=7

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Story must exist",
                "Story can't be blank"
              ]
            }

+ Request returns errors if validations fails (missing content
**PUT**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=&article%5Bname%5D=Test+article+11&article%5Bsource%5D=blog&article%5Bstory_id%5D=11&id=8

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Content can't be blank"
              ]
            }

+ Request returns errors if validations fails (missing source
**PUT**&nbsp;&nbsp;`/articles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            article%5Bcontent%5D=Test+content+12&article%5Bname%5D=Test+article+12&article%5Bsource%5D=&article%5Bstory_id%5D=12&id=9

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Source can't be blank"
              ]
            }

### Scaffold article [POST /articles/scaffold]

+ Parameters
    + story_id: `1` (number, required) - story id that article belongs to

+ Request creates scaffold article
**POST**&nbsp;&nbsp;`/articles/scaffold`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            story_id=13

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

### Apply filtering [GET /articles/search]

+ Parameters
    + condition: `test` (string, optional) - filtering condition
    + story_id: `1` (number, optional) - story id that article belongs to
    + group: `name` (string, optional) - field for group clause
    + order: `status` (string, optional) - field for ordering

+ Request returns article
**POST**&nbsp;&nbsp;`/articles/search`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            order=id&story_id=14

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles": [
                {
                  "id": 11,
                  "name": "Test article 13",
                  "content": "Test content 13",
                  "story_id": 14,
                  "created_at": "2019-12-23T05:37:47.631Z",
                  "updated_at": "2019-12-23T05:37:47.631Z",
                  "source": "facebook"
                },
                {
                  "id": 12,
                  "name": "Test article 14",
                  "content": "Test content 14",
                  "story_id": 14,
                  "created_at": "2019-12-23T05:37:47.633Z",
                  "updated_at": "2019-12-23T05:37:47.633Z",
                  "source": "blog"
                },
                {
                  "id": 13,
                  "name": "Test article 15",
                  "content": "Test content 15",
                  "story_id": 14,
                  "created_at": "2019-12-23T05:37:47.634Z",
                  "updated_at": "2019-12-23T05:37:47.634Z",
                  "source": "other"
                },
                {
                  "id": 14,
                  "name": "Test article 16",
                  "content": "Test content 16",
                  "story_id": 14,
                  "created_at": "2019-12-23T05:37:47.635Z",
                  "updated_at": "2019-12-23T05:37:47.635Z",
                  "source": "other"
                },
                {
                  "id": 15,
                  "name": "Test article 17",
                  "content": "Test content 17",
                  "story_id": 15,
                  "created_at": "2019-12-23T05:37:47.638Z",
                  "updated_at": "2019-12-23T05:37:47.638Z",
                  "source": "blog"
                },
                {
                  "id": 16,
                  "name": "Test article 18",
                  "content": "Test content 18",
                  "story_id": 16,
                  "created_at": "2019-12-23T05:37:47.640Z",
                  "updated_at": "2019-12-23T05:37:47.640Z",
                  "source": "facebook"
                }
              ]
            }

+ Request returns articles by condition
**POST**&nbsp;&nbsp;`/articles/search`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            condition=other&order=id

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles": [
                {
                  "id": 17,
                  "name": "Test article 19",
                  "content": "Test content 19",
                  "story_id": 17,
                  "created_at": "2019-12-23T05:37:47.646Z",
                  "updated_at": "2019-12-23T05:37:47.646Z",
                  "source": "other"
                },
                {
                  "id": 18,
                  "name": "Test article 20",
                  "content": "Test content 20",
                  "story_id": 17,
                  "created_at": "2019-12-23T05:37:47.647Z",
                  "updated_at": "2019-12-23T05:37:47.647Z",
                  "source": "facebook"
                },
                {
                  "id": 19,
                  "name": "Test article 21",
                  "content": "Test content 21",
                  "story_id": 17,
                  "created_at": "2019-12-23T05:37:47.648Z",
                  "updated_at": "2019-12-23T05:37:47.648Z",
                  "source": "other"
                },
                {
                  "id": 20,
                  "name": "Test article 22",
                  "content": "Test content 22",
                  "story_id": 17,
                  "created_at": "2019-12-23T05:37:47.649Z",
                  "updated_at": "2019-12-23T05:37:47.649Z",
                  "source": "tweet"
                },
                {
                  "id": 21,
                  "name": "Test article 23",
                  "content": "Test content 23",
                  "story_id": 18,
                  "created_at": "2019-12-23T05:37:47.652Z",
                  "updated_at": "2019-12-23T05:37:47.652Z",
                  "source": "blog"
                },
                {
                  "id": 22,
                  "name": "Test article 24",
                  "content": "Test content 24",
                  "story_id": 19,
                  "created_at": "2019-12-23T05:37:47.654Z",
                  "updated_at": "2019-12-23T05:37:47.654Z",
                  "source": "tweet"
                }
              ]
            }

### Apply group clause [GET /articles/group]

+ Parameters
    + condition: `test` (string, optional) - filtering condition
    + story_id: `1` (number, optional) - story id that article belongs to
    + group: `name` (string, optional) - field for group clause
    + order: `status` (string, optional) - field for ordering

+ Request returns article
**POST**&nbsp;&nbsp;`/articles/group`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            group=source&order=id&story_id=20

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles": {
                "20": [
                  {
                    "id": 23,
                    "name": "Test article 25",
                    "content": "Test content 25",
                    "story_id": 20,
                    "created_at": "2019-12-23T05:37:47.660Z",
                    "updated_at": "2019-12-23T05:37:47.660Z",
                    "source": "facebook"
                  },
                  {
                    "id": 24,
                    "name": "Test article 26",
                    "content": "Test content 26",
                    "story_id": 20,
                    "created_at": "2019-12-23T05:37:47.661Z",
                    "updated_at": "2019-12-23T05:37:47.661Z",
                    "source": "tweet"
                  },
                  {
                    "id": 25,
                    "name": "Test article 27",
                    "content": "Test content 27",
                    "story_id": 20,
                    "created_at": "2019-12-23T05:37:47.663Z",
                    "updated_at": "2019-12-23T05:37:47.663Z",
                    "source": "other"
                  },
                  {
                    "id": 26,
                    "name": "Test article 28",
                    "content": "Test content 28",
                    "story_id": 20,
                    "created_at": "2019-12-23T05:37:47.664Z",
                    "updated_at": "2019-12-23T05:37:47.664Z",
                    "source": "other"
                  }
                ],
                "21": [
                  {
                    "id": 27,
                    "name": "Test article 29",
                    "content": "Test content 29",
                    "story_id": 21,
                    "created_at": "2019-12-23T05:37:47.666Z",
                    "updated_at": "2019-12-23T05:37:47.666Z",
                    "source": "facebook"
                  }
                ],
                "22": [
                  {
                    "id": 28,
                    "name": "Test article 30",
                    "content": "Test content 30",
                    "story_id": 22,
                    "created_at": "2019-12-23T05:37:47.668Z",
                    "updated_at": "2019-12-23T05:37:47.668Z",
                    "source": "facebook"
                  }
                ]
              }
            }

+ Request returns articles by condition
**POST**&nbsp;&nbsp;`/articles/group`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            condition=other&group=source&order=id

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles": {
                "23": [
                  {
                    "id": 29,
                    "name": "Test article 31",
                    "content": "Test content 31",
                    "story_id": 23,
                    "created_at": "2019-12-23T05:37:47.675Z",
                    "updated_at": "2019-12-23T05:37:47.675Z",
                    "source": "other"
                  },
                  {
                    "id": 30,
                    "name": "Test article 32",
                    "content": "Test content 32",
                    "story_id": 23,
                    "created_at": "2019-12-23T05:37:47.676Z",
                    "updated_at": "2019-12-23T05:37:47.676Z",
                    "source": "other"
                  },
                  {
                    "id": 31,
                    "name": "Test article 33",
                    "content": "Test content 33",
                    "story_id": 23,
                    "created_at": "2019-12-23T05:37:47.677Z",
                    "updated_at": "2019-12-23T05:37:47.677Z",
                    "source": "blog"
                  },
                  {
                    "id": 32,
                    "name": "Test article 34",
                    "content": "Test content 34",
                    "story_id": 23,
                    "created_at": "2019-12-23T05:37:47.678Z",
                    "updated_at": "2019-12-23T05:37:47.678Z",
                    "source": "blog"
                  }
                ],
                "24": [
                  {
                    "id": 33,
                    "name": "Test article 35",
                    "content": "Test content 35",
                    "story_id": 24,
                    "created_at": "2019-12-23T05:37:47.680Z",
                    "updated_at": "2019-12-23T05:37:47.680Z",
                    "source": "other"
                  }
                ],
                "25": [
                  {
                    "id": 34,
                    "name": "Test article 36",
                    "content": "Test content 36",
                    "story_id": 25,
                    "created_at": "2019-12-23T05:37:47.682Z",
                    "updated_at": "2019-12-23T05:37:47.682Z",
                    "source": "facebook"
                  }
                ]
              }
            }

### Apply count clause [GET /articles/count]

+ Parameters
    + condition: `test` (string, optional) - filtering condition
    + story_id: `1` (number, optional) - story id that article belongs to
    + group: `name` (string, optional) - field for group clause
    + order: `status` (string, optional) - field for ordering

+ Request returns article
**POST**&nbsp;&nbsp;`/articles/count`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            order=id&story_id=26

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles_count": 6
            }

# Group Stories


## Stories [/stories]


### Create story [POST /stories]

+ Parameters
    + name: `test` (string, required) - article name

+ Request creates stoy
**POST**&nbsp;&nbsp;`/stories`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            story%5Bname%5D=test

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
            
              ]
            }

+ Request returns errors if validations fails (missing :name
**POST**&nbsp;&nbsp;`/stories`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            story%5Bname%5D=

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name can't be blank"
              ]
            }

### Destroy story [DELETE /stories/{id}]

+ Parameters
    + id: `1` (number, required) - story id

+ Request deletes stories
**DELETE**&nbsp;&nbsp;`/stories/30`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

### Update story [PUT /stories/{id}]

+ Parameters
    + id: `1` (number, required) - story id
    + name: `test` (string, required) - story name

+ Request updates stories
**PUT**&nbsp;&nbsp;`/stories`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            story%5Bname%5D=test

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
            
              ]
            }

+ Request returns errors if validations fails (missing :name)
**PUT**&nbsp;&nbsp;`/stories`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            id=33&story%5Bname%5D=

+ Response 400

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name can't be blank"
              ]
            }

### Scaffold story [POST /stories/scaffold]


+ Request creates scaffold story
**POST**&nbsp;&nbsp;`/stories/scaffold`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

### Apply filtering [GET /stories/search]

+ Parameters
    + condition: `test` (string, optional) - filtering condition
    + story_id: `1` (number, optional) - story id that article belongs to
    + group: `name` (string, optional) - field for group clause
    + order: `status` (string, optional) - field for ordering

+ Request returns stories by story id
**POST**&nbsp;&nbsp;`/stories/search`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            order=id&story_id=35

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles": [
                {
                  "story": {
                    "id": 35,
                    "name": "Test story 32",
                    "created_at": "2019-12-23T05:37:47.730Z",
                    "updated_at": "2019-12-23T05:37:47.730Z"
                  },
                  "totals": {
                    "facebook": 1,
                    "tweet": 2,
                    "other": 1
                  },
                  "last_article": {
                    "id": 44,
                    "name": "Test article 46",
                    "content": "Test content 46",
                    "story_id": 35,
                    "created_at": "2019-12-23T05:37:47.736Z",
                    "updated_at": "2019-12-23T05:37:47.736Z",
                    "source": "tweet"
                  }
                },
                {
                  "story": {
                    "id": 36,
                    "name": "Test story 33",
                    "created_at": "2019-12-23T05:37:47.737Z",
                    "updated_at": "2019-12-23T05:37:47.737Z"
                  },
                  "totals": {
                    "tweet": 1
                  },
                  "last_article": {
                    "id": 45,
                    "name": "Test article 47",
                    "content": "Test content 47",
                    "story_id": 36,
                    "created_at": "2019-12-23T05:37:47.738Z",
                    "updated_at": "2019-12-23T05:37:47.738Z",
                    "source": "tweet"
                  }
                },
                {
                  "story": {
                    "id": 37,
                    "name": "Test story 34",
                    "created_at": "2019-12-23T05:37:47.740Z",
                    "updated_at": "2019-12-23T05:37:47.740Z"
                  },
                  "totals": {
                    "facebook": 1
                  },
                  "last_article": {
                    "id": 46,
                    "name": "Test article 48",
                    "content": "Test content 48",
                    "story_id": 37,
                    "created_at": "2019-12-23T05:37:47.740Z",
                    "updated_at": "2019-12-23T05:37:47.740Z",
                    "source": "facebook"
                  }
                }
              ]
            }

+ Request returns stories by condition
**POST**&nbsp;&nbsp;`/stories/search`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            condition=other&order=id

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "articles": [
                {
                  "story": {
                    "id": 38,
                    "name": "Test story 35",
                    "created_at": "2019-12-23T05:37:47.766Z",
                    "updated_at": "2019-12-23T05:37:47.766Z"
                  },
                  "totals": {
                    "blog": 2,
                    "tweet": 1,
                    "other": 1
                  },
                  "last_article": {
                    "id": 50,
                    "name": "Test article 52",
                    "content": "Test content 52",
                    "story_id": 38,
                    "created_at": "2019-12-23T05:37:47.771Z",
                    "updated_at": "2019-12-23T05:37:47.771Z",
                    "source": "other"
                  }
                },
                {
                  "story": {
                    "id": 39,
                    "name": "Test story 36",
                    "created_at": "2019-12-23T05:37:47.772Z",
                    "updated_at": "2019-12-23T05:37:47.772Z"
                  },
                  "totals": {
                    "tweet": 1
                  },
                  "last_article": {
                    "id": 51,
                    "name": "Test article 53",
                    "content": "Test content 53",
                    "story_id": 39,
                    "created_at": "2019-12-23T05:37:47.773Z",
                    "updated_at": "2019-12-23T05:37:47.773Z",
                    "source": "tweet"
                  }
                },
                {
                  "story": {
                    "id": 40,
                    "name": "Test story 37",
                    "created_at": "2019-12-23T05:37:47.775Z",
                    "updated_at": "2019-12-23T05:37:47.775Z"
                  },
                  "totals": {
                    "other": 1
                  },
                  "last_article": {
                    "id": 52,
                    "name": "Test article 54",
                    "content": "Test content 54",
                    "story_id": 40,
                    "created_at": "2019-12-23T05:37:47.776Z",
                    "updated_at": "2019-12-23T05:37:47.776Z",
                    "source": "other"
                  }
                }
              ]
            }
