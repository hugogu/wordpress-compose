UPDATE `wp_posts`
 SET guid = REPLACE(guid, '${FROM_HOST}' ,'${TO_HOST}');

UPDATE `wp_posts`
 SET post_content = 
    REPLACE(post_content, '${FROM_HOST}' ,'${TO_HOST}');

UPDATE `wp_options`
 SET option_value = 
    REPLACE(option_value, '${FROM_HOST}' ,'${TO_HOST}') 
 WHERE option_name = 'home' OR option_name = 'siteurl';
