<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>

<p>
<?php echo $params->get('street'); ?><br />
<?php echo $params->get('zip'); ?> <?php echo $params->get('city'); ?><br />
T: <?php echo $params->get('phone'); ?><br />
F: <?php echo $params->get('fax'); ?>
</p>

<p>
<?php if($params->get('link_url') && $params->get('link_text') ) : ?>
<a href="<?php echo $params->get('link_url'); ?>"><?php echo $params->get('link_text'); ?></a>
<?php endif ?>
</p>