
{if $smarty.session.AUTHENTICATED|default}
<script src="{$PATH}/js/plugins/date.format.js"></script>
<script src="{$PATH}/js/plugins/soundjs-0.6.0.min.js"></script>
<script src="{$PATH}/js/translations.js"></script>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <h4 class="panel-title"><i class="fa fa-align-left fa-fw"></i><span class="dasha1"> Обзор</span></h4>
      </div>
      <div class="panel-body text-center">
        <div class="row">
          <div class="col-lg-12">
		  
          {* Load our payout system so we can load some payout specific templates *}
          {assign var=PAYOUT_SYSTEM value=$GLOBAL.config.payout_system}
          {include file="dashboard/overview/default.tpl"}
          {include file="dashboard/round_statistics/$PAYOUT_SYSTEM/default.tpl"}
          {include file="dashboard/account_data/default.tpl"}
          {if !$DISABLED_API}
          {include file="dashboard/worker_information/default.tpl"}
          {/if}
          {include file="dashboard/blocks/default.tpl"}
          </div>
        </div>
      </div>
      <div class="panel-footer">
       <center> <h6><span class="dasha2"> Update interval:</span> {$GLOBAL.config.statistics_ajax_refresh_interval|default:"60"} <span class="dasha3">seconds for farms and account</span> {$GLOBAL.config.statistics_ajax_long_refresh_interval|default:"30"} <span class="dasha4">seconds. Hashrayt is displayed by data for</span>  {$INTERVAL|default:"5"} <span class="dasha5">minutes.</span></h6></center>
      </div>
    </div>
  </div>
</div>
  {* Include our JS libraries, we allow a live updating JS and a static one *}
  {if !$DISABLED_DASHBOARD and !$DISABLED_DASHBOARD_API}
  {include file="dashboard/js/api.tpl"}
  {else}
  {include file="dashboard/js/static.tpl"}
  {/if}
{/if}