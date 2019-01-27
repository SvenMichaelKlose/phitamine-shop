(var *gallery-archive-path*)

(fn image-path (section user-id)
  (+ (href *_SERVER* "DOCUMENT_ROOT") *gallery-archive-path* "/" (| user-id 1) "/" section))

(fn image-path-originals (user-id)
  (image-path "original" user-id))

(fn image-path-thumbnails (user-id)
  (image-path "thumb" user-id))

(fn create-path (x)
  (| (file_exists x)
     (mkdir x 255 t)))

(fn create-image-paths (id-user)
  (create-path (image-path-originals id-user))
  (create-path (image-path-thumbnails id-user)))

(fn path-original (id-user name)
  (+ (image-path-originals id-user) "/" name))

(fn path-thumbnail (id-user name)
  (+ (image-path-thumbnails id-user) "/" name))
