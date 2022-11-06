Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A7FC4332F
	for <linux-mips@archiver.kernel.org>; Sun,  6 Nov 2022 17:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiKFRom (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 6 Nov 2022 12:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiKFRol (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Nov 2022 12:44:41 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694326422;
        Sun,  6 Nov 2022 09:44:40 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id 11so7296000iou.0;
        Sun, 06 Nov 2022 09:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmwpYCTGFDgeBb3yaFM0SZa/jnM1t19xpWxBuBKJal8=;
        b=FdnOLJCaxhF57Ct4n+8ZKrn1+v5QwMN+hsh06h/iWEb1N8H9iGKcFf6xiTsvHnaAIi
         KehmF31IWBfev4X0kwpNLvQfbOSYqsP9jjGJgagF58XtGeO22Qw/zyQd65J02lQTRH1n
         qFXeMRJsW9/bRiJ9vHdV9S6oZuIxtgVB8N5sIp6jf1MGi8m4bymCETSvaRU2pCQuxJ9J
         OXpPHaDeadltcQUwxRLiCM+80tBDiz6QB3KPs0yBfY4Rl3HLbcbjPhOWcbokvl/AeUqk
         45DTKn9D3LLfcoOBU/84Nb6s8T2QHof2mBeY1eoQ7s14pkGmBNC08NtXNz8DGt9aIaA6
         zXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmwpYCTGFDgeBb3yaFM0SZa/jnM1t19xpWxBuBKJal8=;
        b=lXlkQiepEGE6yQ/AaKs5T2CVI6LF5CPKjj1m8jgfoCrgssZuNu5gRXEXpjMvovZjsT
         wUAo45Sb/bIEWUEtRqh5fOmF9waOPXiFf4QmstE+/GQKaMJmtSI8jN+Yy1D3rvA3ipGo
         IfZPdmON4AqmIm2Csx/GxRKgrKawRD42zU0b++S/Fi2uZg3bG7YLRElbQ/Yl5ldv8fsk
         7bCZj/ur7/lgW8ssoXAGJ4/UZmjM3zyADLpKpcDCeTRtB8UACCQauHw7lenrWePV5B6Z
         LaY0iZ0ssfwejylGk5gQ/nBYhYRXGG/RQjFAuvwP9oxE5gVTXmxsG2LDgvp2AhWZt86c
         BPGw==
X-Gm-Message-State: ACrzQf2yrm6YNf2bgtNzXGaPigQCdLZRPERUx8cmaysqOfefGgvX6oj/
        izXUPt1bg6k58OXga8CBokUMVeOfZ1ysutoBjvC/llaFNtc=
X-Google-Smtp-Source: AMsMyM418EFQAdgZSCnwSka9QG7J5t/0cMR9HkkhAMxXuxbHyH/U0bq+Cin5uEekUmsh5uyq/C/AGzh6E6wYz9I6AcA=
X-Received: by 2002:a5d:9552:0:b0:6ce:64b7:5198 with SMTP id
 a18-20020a5d9552000000b006ce64b75198mr19618284ios.108.1667756679822; Sun, 06
 Nov 2022 09:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20221106170637.1580802-1-sashal@kernel.org> <20221106170637.1580802-9-sashal@kernel.org>
In-Reply-To: <20221106170637.1580802-9-sashal@kernel.org>
From:   Siarhei Volkau <lis8215@gmail.com>
Date:   Sun, 6 Nov 2022 20:44:28 +0300
Message-ID: <CAKNVLfZ63utLSOujoTZqN8jHKwYwqb-Z0E=VwueFmwMJf961iA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 09/12] ASoC: codecs: jz4725b: fix capture
 selector naming
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, paul@crapouillou.net,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-mips@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=D0=B2=D1=81, 6 =D0=BD=D0=BE=D1=8F=D0=B1. 2022 =D0=B3. =D0=B2 20:06, Sasha =
Levin <sashal@kernel.org>:
> +       {"ADC Sourc Capture Routee", "Line In", "Line In"},

Please make sure you're grabbing df496157a5af companion commit.

BR,
Siarhei
