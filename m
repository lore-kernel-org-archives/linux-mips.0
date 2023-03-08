Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B499EC678D5
	for <linux-mips@archiver.kernel.org>; Wed,  8 Mar 2023 21:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCHV4Y (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 8 Mar 2023 16:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjCHV4P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Mar 2023 16:56:15 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB7CD13D0
        for <linux-mips@vger.kernel.org>; Wed,  8 Mar 2023 13:56:14 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536bf92b55cso329330697b3.12
        for <linux-mips@vger.kernel.org>; Wed, 08 Mar 2023 13:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678312573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SNpxUvoL3wJxQvDMk4hmZFaxXnNEcCgcZlciVtsvXc=;
        b=CDQcTCIVb/Mbv0ESOZ6tgosr11PuDIjK/sne0DVXVcMGwsaSV0+NmVsnd2HG1WfuNG
         Y4KzJFuCJ6sorGtK20lC8/nM/kecNTJdJRJs1wMs9axjzcPpn8LjzNn6YEPUQ1N6heOI
         y72YJ7p4DvB3ei8QC1Mlj8qEvqjtXS+pIgguSFuCWqR98j4MYIvP7capwe2QYoMpUqwC
         bK5Q7HAEQRGCFdGZjcGNLx/BRRPYpN4TtN1wFSygnsKwCj4Y1hQ83NVZTM9a2MOWIcWu
         mdR0TryaP9O58xQ5iYRXdRa/LnUMjrdF1so+7ag4xgSMK5SR10JQJq2Wl1FAnHx/2zNu
         cPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SNpxUvoL3wJxQvDMk4hmZFaxXnNEcCgcZlciVtsvXc=;
        b=grhvKZS1CN8CxqaRlQiz2MvaRGcNG9oNMOTLE90XbylIWRLgYHBhSFOH8RRItfQ4xC
         bCfauipG0wwmy8yOVWucmbvh23O5UTBedp/4OHHREks4wktut2ILP0cGw93HL/0Qog3X
         oR1ewbA47/fpSQ/nccnZFg1UUMp/kov+A69P0Tzbqo2YztTA3HqgVT2skooQCQemU2CK
         aXA2Ft+EkcY+cjLx5td9n8shr3pypKmfyAYg4LVAZG4AebtGEphoG461USr8nJR0gU2y
         jWGul4LiAa5dHnVP/4+qwHniW6PvbcjXIo37sIAba7EEeJGMdOKNj8UeogOM2S4HDZMh
         EgHQ==
X-Gm-Message-State: AO0yUKUCTGvic+wFT3M4zDwk4C/JDHiL0lZbd6J7BD0O4tAQRe67YB//
        tjS2GAJkXW1rx8P7rRWzSuvkqVXeJG8Bz9zLZsUKtg==
X-Google-Smtp-Source: AK7set8yauEv2vcx8SVSOeBSvIcZLRFAawEdiiK3vsGVmvLq0nGKK1nv0pzzTynl2uX93OymJM1VQT+KwzqxmI6CYtw=
X-Received: by 2002:a81:b149:0:b0:530:b21f:d604 with SMTP id
 p70-20020a81b149000000b00530b21fd604mr4893153ywh.9.1678312573418; Wed, 08 Mar
 2023 13:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20230308145303.826942-1-arnd@kernel.org>
In-Reply-To: <20230308145303.826942-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Mar 2023 22:56:02 +0100
Message-ID: <CACRpkdZAJJr5+f8wiEhnAAV8mLjzYCBMDC9GXwQOAmsQLfShoA@mail.gmail.com>
Subject: Re: [PATCH] mips: ar71: include linux/gpio/driver.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 8, 2023 at 3:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The change to remove the implicit gpio/driver.h include was done
> after fixing all the other users, but the ar7 file still needs
> the same change.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 21d9526d13b5 ("gpiolib: Make the legacy <linux/gpio.h> consumer-on=
ly")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If this is the only problem merging this set was amazingly painless.

Yours,
Linus Walleij
