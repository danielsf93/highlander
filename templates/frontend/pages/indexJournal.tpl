{**
 * templates/frontend/pages/indexJournal.tpl

 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<main id="highlander_content_main">

	{call_hook name="Templates::Index::journal"}

	{if $showJournalDescription && $currentJournal->getLocalizedDescription()}
		<section class="journal-description{if $isJournalDescriptionDark} section_dark{/if}"{if $journalDescriptionColour} style="background-color: {$journalDescriptionColour|escape};"{/if}>
			<div class="container">
				<header class="row">
					<h3 class="col-md-6">
						{translate key="navigation.about"}
					</h3>
				</header>
				<div class="row">
					<div class="col-md-6 col-lg-8">
						{$currentJournal->getLocalizedDescription()}
					
					</div>
				</div>
			</div>
		</section>
	{/if}










<section class="estatisticas_gerais section_dark"{if $journalDescriptionColour} style="background-color: {$journalDescriptionColour|escape};"{/if}>
			<div class="container">
				<header class="row">
					<h1 class="col-md-6">
						<p>Estatisticas Gerais:</p>
					</h1>
				</header>
				
				<header class="row">
					<h3 class="col-md-6">
						<p>Revistas:</p>
					</h3>
				</header>

				<header class="row">
					<h3 class="col-md-6">
						<p>Fascículos:</p>
					</h3>
				</header>

				<header class="row">
					<h3 class="col-md-6">
						<p>Artigos:</p>
					</h3>
				</header>

				<header class="row">
					<h3 class="col-md-6">
						<p>Downloads:</p>
					</h3>
				</header>

				<header class="row">
					<h3 class="col-md-6">
						<p>Acessos:</p>
					</h3>
				</header>





			</div>
		</section>
<hr>

<section class="links section_dark"{if $journalDescriptionColour} style="background-color: {$journalDescriptionColour|escape};"{/if}>
			<div class="container">
				<header class="row">
					<h1 class="col-md-6">
						<p>Estatisticas Detalhadas:</p>
					</h1>
				</header>
				
				











			</div>
		</section>







	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<section class="announcements{if $isAnnouncementDark} section_dark{/if}"{if $highlanderAnnouncementsColor} style="background-color: {$highlanderAnnouncementsColor|escape};"{/if}>
			<div class="container">
				<header class="row">
					<h3 class="col-md-6">
						{translate key="announcement.announcements"}
					</h3>
				</header>

				<ul class="row announcement-section__toc">
					{foreach from=$announcements item=announcement}
						<li class="col-md-4">
							<p class="announcement__date">{$announcement->getDatePosted()|date_format:$dateFormatShort|escape}</p>
							<h4 class="announcement__title">
								<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()|escape}">
									{$announcement->getLocalizedTitle()|escape}
								</a>
							</h4>
							<p>{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}</p>
						</li>
					{/foreach}
				</ul>
			</div>
		</section>
	{/if}

	{if $issue}
		<section class="issue">

			{* Latest issue *}
			{include file="frontend/objects/issue_toc.tpl"}

		</section>
	{/if}
</main><!-- .page -->

{* Additional Homepage Content *}
{if $additionalHomeContent}
	<aside {if $lastSectionColor}style="background-color: {$lastSectionColor|escape};"{/if}>
		<div class="container additional-home-content">
			{$additionalHomeContent|strip_unsafe_html}
		</div>
	</aside>
{/if}

{include file="frontend/components/footer.tpl"}
