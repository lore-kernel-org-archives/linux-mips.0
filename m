Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1FBC4332F
	for <linux-mips@archiver.kernel.org>; Thu, 20 Oct 2022 12:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiJTMBi (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 20 Oct 2022 08:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJTMBg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Oct 2022 08:01:36 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF3C176504;
        Thu, 20 Oct 2022 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1666267294; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kYZkMXb8cLrbAN/CA61ncAdPT59/Ov5LSx67xqlB97U=;
        b=L18CzQrw7V+n4B5ZpLcqlPBG/6rfQV04LgnOvTJ6SITL6SqOXJRru6HOVr7mXV67vKz82z
        XisgI6GBSkwD0psBpHRV63JFijaOkmotWJ+2CmYYyJROkxz0cnFCqb5LyiUdPGHnvZiijV
        /MNpWHEOKupv92NNGocYJSSrpCBQt3U=
Date:   Thu, 20 Oct 2022 13:01:24 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 0/7] ASoC: codecs: jz4725b: Various improvements and
 fixes
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-mips@vger.kernel.org, alsa-devel@alsa-project.org
Message-Id: <C2W1KR.XY3W8ZXSCSAD1@crapouillou.net>
In-Reply-To: <CAKNVLfbfRRE3O2uFH6MQxoa_cdqTUcvpGzmcxFm3oCLKFfHv6w@mail.gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
        <166609251307.155136.11548088283059583394.b4-ty@kernel.org>
        <CAKNVLfbfRRE3O2uFH6MQxoa_cdqTUcvpGzmcxFm3oCLKFfHv6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Siarhei,

Le jeu., oct. 20 2022 at 14:58:51 +0300, Siarhei Volkau=20
<lis8215@gmail.com> a =C3=A9crit :
> =D0=B2=D1=82, 18 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 14:28, Mark Brow=
n <broonie@kernel.org>:
>>  Applied to
>>=20
>>    =20
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=20
>> for-next
>>=20
>>  Thanks!
>=20
> Great! Thank you!
>=20
> Unfortunately I found a critical bug in my patchset, yet easy to fix.
> So I need some help to make and send the fix.
>=20
>>  If any updates are required or you are submitting further changes=20
>> they
>>  should be sent as incremental updates against current git, existing
>>  patches will not be replaced.
>=20
> What are mailing lists it needs to be sent to?
> Any additional tags needed? I know about Fixes tag.
> Do I need to keep a link on this patchset somehow?
> Do I need to mail a patch with the fix to this thread or
> create a new one?
>=20
> PS: the patch will look like:
>  - {"ADC Sourc Capture Routee", "Line In", "Line In"},
>  + {"ADC Source Capture Route", "Line In", "Line In"},

Somebody already submitted a fix.

> Thanks in advance,
> Siarhei

Cheers,
-Paul


