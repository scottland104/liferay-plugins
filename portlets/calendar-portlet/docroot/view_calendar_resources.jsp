<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
String tabs1 = ParamUtil.getString(request, "tabs1", "calendar");

CalendarResourceDisplayTerms displayTerms = new CalendarResourceDisplayTerms(renderRequest);
%>

<liferay-portlet:renderURL varImpl="searchURL">
	<portlet:param name="mvcPath" value="/view.jsp" />
	<portlet:param name="tabs1" value="resources" />
</liferay-portlet:renderURL>

<aui:form action="<%= searchURL %>" method="get" name="fm">
	<liferay-portlet:renderURLParams varImpl="searchURL" />
	<aui:input name="tabs1" type="hidden" value="<%= tabs1 %>" />

	<liferay-ui:search-form
		page="/calendar_resource_search.jsp"
		servletContext="<%= application %>"
	/>
</aui:form>

<div class="separator"><!-- --></div>

<c:if test="<%= CalendarPortletPermission.contains(permissionChecker, themeDisplay.getScopeGroupId(), ActionKeys.ADD_RESOURCE) %>">
	<aui:button-row>
		<liferay-portlet:renderURL var="editCalendarResourceURL">
			<liferay-portlet:param name="jspPage" value="/edit_calendar_resource.jsp" />
			<liferay-portlet:param name="redirect" value="<%= currentURL %>" />
		</liferay-portlet:renderURL>

		<aui:button onClick="<%= editCalendarResourceURL %>" value="add-calendar-resource" />
	</aui:button-row>
</c:if>

<liferay-portlet:renderURL varImpl="iteratorURL">
	<portlet:param name="mvcPath" value="/view_calendar_resources.jsp" />
</liferay-portlet:renderURL>

<c:choose>
	<c:when test="<%= displayTerms.getScope() == themeDisplay.getCompanyGroupId() %>">
		<h3><liferay-ui:message key="users" /></h3>

		<%@ include file="/calendar_resource_user_search_container.jspf" %>

		<h3><liferay-ui:message key="sites" /></h3>

		<%@ include file="/calendar_resource_group_search_container.jspf" %>
	</c:when>
	<c:otherwise>
		<%@ include file="/calendar_resource_search_container.jspf" %>
	</c:otherwise>
</c:choose>