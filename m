Return-Path: <SRS0=RuC1=7E=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5403BC433DF
	for <linux-mips@archiver.kernel.org>; Fri, 22 May 2020 12:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EA9E206B6
	for <linux-mips@archiver.kernel.org>; Fri, 22 May 2020 12:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="f7NFFBWR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgEVM01 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 22 May 2020 08:26:27 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:53590 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728809AbgEVM01 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 May 2020 08:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590150385; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MRKS9fqXzGzQMKHN8PdUSNujYDogHAul97G0jJgVbv0=;
        b=f7NFFBWRYPcg+MQZpHOet66JdhhlaTDMa2UOgvwwKlF9bqfTxB911zvnh18E7/7fhkD51X
        DnIl5uPJQB46X8Pev/MjqZ7q6kMiqIeMB3zo96LtEJ7n6LpTtsfkwcI3SO7XG+FVyWA4a1
        sfN+0zpaFNxnKJTjEjbxyxVmzLuMhhg=
Date:   Fri, 22 May 2020 14:26:15 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] clocksource: Ingenic: Add high resolution timer support
 for SMP.
To:     Paul Boddie <paul@boddie.org.uk>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Message-Id: <RVFQAQ.7WL51YCH3VE1@crapouillou.net>
In-Reply-To: <3077290.R152QTsmsV@jeremy>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
        <20200519201110.286501-1-paul@crapouillou.net> <3077290.R152QTsmsV@jeremy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

I think the ingenic-drm driver is fine, even though the old 3.8 kernel=20
worked differently, the IP is backwards-compatible so it should work no=20
problem. I think the problem is somewhere in the Synopsis HDMI code or=20
the glue code. Because the LCDC does seem to send data, which is not=20
encoded properly by the HDMI chip.

-Paul


Le jeu. 21 mai 2020 =E0 0:14, Paul Boddie <paul@boddie.org.uk> a =E9crit :
> On Tuesday 19. May 2020 22.11.10 Paul Cercueil wrote:
>>=20
>>  I took the liberty to clean your patch so that it doesn't create a
>>  struct ingenic_tcu per CPU timer.
>>=20
>>  Tested, and fully working on the JZ4770 with CONFIG_SMP disabled,=20
>> and
>>  also with CONFIG_SMP enabled (even though JZ4770 has only one CPU)=20
>> with
>>  a fixed smp.c and USB disabled (otherwise it crashes at boot).
>=20
> Thanks for looking at this and also your continuing work with the DRM=20
> driver.
> I'll try and look a bit more at the DRM driver for the JZ4780 and see=20
> what I
> am doing wrong with regard to JZ4780-specific configuration. In=20
> principle,
> there should not be any, but I don't really have the full picture=20
> (literally
> and also in terms of documentation or understanding).
>=20
> One thing that seems to be done with the Imagination/Ingenic drivers=20
> is dual
> DMA channel initialisation. Usually, this seems to be necessary only=20
> for dual-
> panel configurations, and I wonder whether there is some kind of=20
> requirement
> for the same arrangement when using the HDMI output.
>=20
> Another thing that is done involves setting a foreground, which might=20
> be
> relevant to your more recent contributions adding IPU support. Again,=20
> I don't
> really understand why this seems necessary, but the documentation=20
> hardly
> provides any details that might explain it.
>=20
> Paul


