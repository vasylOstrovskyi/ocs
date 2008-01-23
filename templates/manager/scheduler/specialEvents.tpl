{**
 * specialEvents.tpl
 *
 * Copyright (c) 2000-2007 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of specialEvents in the Scheduler in conference management.
 *
 * $Id$
 *}
{assign var="pageTitle" value="manager.scheduler.specialEvents"}
{assign var="pageId" value="manager.scheduler.specialEvents"}
{include file="common/header.tpl"}

<br />

<a name="specialEvents"></a>

<table width="100%" class="listing">
	<tr>
		<td colspan="2" class="headseparator">&nbsp;</td>
	</tr>
	<tr class="heading" valign="bottom">
		<td width="85%">{translate key="manager.scheduler.specialEvent.name"}</td>
		<td width="15%">{translate key="common.action"}</td>
	</tr>
	<tr>
		<td colspan="2" class="headseparator">&nbsp;</td>
	</tr>
{iterate from=specialEvents item=specialEvent}
	<tr valign="top">
		<td>{$specialEvent->getSpecialEventName()|escape}</td>
		<td><a href="{url op="editSpecialEvent" path=$specialEvent->getSpecialEventId()}" class="action">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteSpecialEvent" path=$specialEvent->getSpecialEventId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.scheduler.specialEvent.confirmDelete"}')" class="action">{translate key="common.delete"}</a></td>
	</tr>
	<tr>
		<td colspan="2" class="{if $specialEvents->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $specialEvents->wasEmpty()}
	<tr>
		<td colspan="2" class="nodata">{translate key="manager.scheduler.specialEvent.noneCreated"}</td>
	</tr>
	<tr>
		<td colspan="2" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td align="left">{page_info iterator=$specialEvents}</td>
		<td align="right">{page_links anchor="specialEvents" name="specialEvents" iterator=$specialEvents}</td>
	</tr>
{/if}
</table>

<a href="{url op="createSpecialEvent"}" class="action">{translate key="manager.scheduler.specialEvent.create"}</a>

{include file="common/footer.tpl"}
