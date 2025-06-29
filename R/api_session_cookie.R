#' Turn on session cookie data storage for your API
#'
#' If you need to keep data between requests, but don't want to store it
#' server-side you can instead pass it back and forth as an encrypted session
#' cookie. This function sets it up on your api and after it's use you can now
#' access and set session data in the request and response `$session` field. Be
#' aware that session data is send back and forth with all requests and should
#' thus be kept minimal to avoid congestion on your server.
#'
#' # Using annotation
#' Session cookie setup doesn't have a dedicated annotation tag, but you can set
#' it up in a `@plumber` block
#'
#' ```
#' #* @plumber
#' function(api) {
#'   api |>
#'     api_session_cookie(keyring::key_get("my_secret_plumber_key"))
#' }
#' ```
#'
#' @param api A plumber2 api object to add the session cookie setup to
#' @param key A 32-bit secret key as a hex encoded string or a raw vector to
#' use for encrypting the session cookie. A valid key can be generated using
#' [reqres::random_key()]. NEVER STORE THE KEY IN PLAIN TEXT. Optimally use the
#' keyring package to store it
#' @inheritParams reqres::session_cookie
#'
#' @return These functions return the `api` object allowing for easy chaining
#' with the pipe
#'
#' @export
#'
#' @examples
#' key <- reqres::random_key()
#'
#' api() |>
#'   api_session_cookie(key, secure = TRUE) |>
#'   api_get("/", function(request) {
#'     if (isTRUE(request$session$foo)) {
#'       msg <- "You've been here before"
#'     } else {
#'       msg <- "You must be new here"
#'       request$session$foo <- TRUE
#'     }
#'     list(
#'       msg = msg
#'     )
#'   })
#'
api_session_cookie <- function(
  api,
  key,
  name = "reqres",
  expires = NULL,
  max_age = NULL,
  path = NULL,
  secure = NULL,
  same_site = NULL
) {
  api$key <- key
  api$session_cookie_settings <- reqres::session_cookie(
    name = name,
    expires = expires,
    max_age = max_age,
    path = path,
    secure = secure,
    same_site = same_site
  )
  api
}

#' @export
#' @importFrom reqres random_key
reqres::random_key
