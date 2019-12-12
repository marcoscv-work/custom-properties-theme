<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<#--  Custom variables and button examples  -->
<style>
    ${custom_variables}
</style>

<#--  If ie11CustomProperties is selected  -->
<#if custom_variables_polyfill == "ie11CustomProperties">
    <script>window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/npm/ie11-custom-properties@2.6.0/ie11CustomProperties.js"><\script>');</script>
</#if>

<#--  If ponyfill is selected  -->
<#if custom_variables_polyfill == "css-vars-ponyfill">
    <script src="https://unpkg.com/css-vars-ponyfill@2/dist/css-vars-ponyfill.min.js"></script>
</#if>

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container" id="wrapper">
	<header id="banner" role="banner">
		<div id="heading">
            <h1>Polyfill selected: ${custom_variables_polyfill}</h1>
			<h2>Site name: ${site_name}
		</div>

		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
		</#if>

		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
	</header>

	<section id="content">
        <button class="btn btn-blue">btn blue</button>
        <button class="btn btn-red">btn red</button>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

<#if custom_variables_polyfill == "css-vars-ponyfill">
    <script>
        cssVars({
            include: 'style'
        });
    </script>
</#if>

</body>

</html>