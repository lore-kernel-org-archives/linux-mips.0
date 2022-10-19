Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49642C433FE
	for <linux-mips@archiver.kernel.org>; Wed, 19 Oct 2022 12:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbiJSMuj (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 19 Oct 2022 08:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbiJSMt3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Oct 2022 08:49:29 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982371BFBAE;
        Wed, 19 Oct 2022 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1666181989; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pnl1tagyFChrkzlGz6HjWuYebtyn/vrMK3LiUP9HffM=;
        b=iSe7IM2kvt4wU0f/R1sx7KtG14p7PsX14jZsac6EH/Hm+ePU37GS0i+lH/JrG+lxZcPuqW
        DmjdFaUEzZT22AlfMpZZDgt0XxJXby/AMqyBZwfJBXH6gJ8v4auQOU3Q+rZ5kVj5SLqXCk
        ALodkzAUcpiRyD1Vdr6oLNqZYjrO1Pw=
Date:   Wed, 19 Oct 2022 13:19:40 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
To:     Mark Brown <broonie@kernel.org>
Cc:     Colin Ian King <colin.i.king@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <S820KR.GPNPWZ8QG3PG3@crapouillou.net>
In-Reply-To: <Y0/pSVbueZYXBsmA@sirena.org.uk>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
        <Y0/pSVbueZYXBsmA@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mark,

Le mer., oct. 19 2022 at 13:10:49 +0100, Mark Brown=20
<broonie@kernel.org> a =E9crit :
> On Wed, Oct 19, 2022 at 08:16:39AM +0100, Colin Ian King wrote:
>>  There are two spelling mistakes in codec routing description. Fix=20
>> it.
>=20
> Bit disappionting that people didn't notice the errors during boot
> there...

Well that's on you. You merged the patchset before anybody could review.

-Paul


