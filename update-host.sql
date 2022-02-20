UPDATE `wp_posts`
 SET guid = REPLACE(guid, '${WP_FROM_HOST}' ,'${WP_TO_HOST}');

UPDATE `wp_posts`
 SET post_content = 
    REPLACE(post_content, '${WP_FROM_HOST}' ,'${WP_TO_HOST}');

UPDATE `wp_options`
 SET option_value = 
    REPLACE(option_value, '${WP_FROM_HOST}' ,'${WP_TO_HOST}') 
 WHERE option_name = 'home' OR option_name = 'siteurl';
