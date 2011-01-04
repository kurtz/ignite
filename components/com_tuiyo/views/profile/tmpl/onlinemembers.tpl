<?php foreach($users as $user ) : ?>
    <div class="chatMemberDiv" align="center">
        <a href="#" class="chatMemberAnchor" title="<?php echo $user->name ?>" rel="<?php echo $user->id ?>">
            <img src="<?php echo $user->avatar->thumb70 ?>" width="50" class="memberAvatar" />
        </a>
    </div>
<?php endforeach ; ?>
