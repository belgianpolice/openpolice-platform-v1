<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>

<strong><?php echo JText::_('Contact'); ?>: <?php echo $params->get('phone'); ?></strong><?php if ($params->get('emergency') == '1') : ?> - <?php echo JText::_('In an emergency'); ?>: 112<?php endif ?>