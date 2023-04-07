Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FA8C76196
	for <linux-mips@archiver.kernel.org>; Fri,  7 Apr 2023 22:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjDGWVm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 7 Apr 2023 18:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjDGWVl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:21:41 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A87BD337
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 15:21:39 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso8790022pjc.1
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680906099; x=1683498099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro+RVMdXK0NBTuXcel+kdAi7VofZgmQkuCbPGk/bESM=;
        b=b95Ssk747zg+RLEJbR0eO9a1MTDJxYdYnUaZTntSjmS2Rj4HVQ8Jpr0jZIFvMf3fEw
         UOjhsNNB8uqim16QdTBygc9+Ru04GsVKmc5clvuYGGNrEcC19SRfMZ8m/fqKN3OlJPhI
         +X+VRLKwHQ1JOzD4Y4tXdWCYFWtPYYvOYUjJlWzNpyMeyUtUI3fxOgie7g/L+VLkN985
         ss+2cWkPg3uatul3K6jokZN6JROuxVKU/5VeJqzvFoIfcdQG3rzrnuQ53C+KwQddQHCp
         Q5dL8QsHMyMX/sda2+VrNd650x5TMRl+1hGtk3SMZYYpbnLlx/R+gaAdt0FP/EesEB2o
         x6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680906099; x=1683498099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ro+RVMdXK0NBTuXcel+kdAi7VofZgmQkuCbPGk/bESM=;
        b=rWt5pT5heJWnB278Ralhl15LVIqyd9pMovuLqXS7gwnnEzq3GhCCPkGd6opn4Aj6YL
         +v2fEWmSsCsy/nGvxi8GA5OEYjU43NMdcrEC9F6EaRjd0tdYw2NQLjExBvNicR9PgUq3
         4rctCF0DWgHpUwvRwwm7BFaigLlKfCZr5TBPCg6CmgtOwARAOPBztz40eqc2UvkfhW52
         VUQQM2aTa7fxBSI+7PFv/zjDT9VP+mDvN6KdDqONPRMLxB9pF6PhQsg0icu27e7sNce4
         KPXkgt20Mr/aBjbWUJWn+RmmHoBhW2WhgJTcYslAZjOPib3rYuLiE2SRi1WH0H+/wcCh
         F9vQ==
X-Gm-Message-State: AAQBX9eBkaoijOwan01jPyCvsHmGtQLX+KznhRuxD9eSpo82UxAFpgXw
        Moh5fYklV+uWo1PWWuT8Z+ASY+HRJJPGf07a5L0+Fw==
X-Google-Smtp-Source: AKy350bY2iOq+vIPV8oG7runqpk5KeZ0u5OtC5YkazMnPPKV8eLNQwNE533J4ChDGGPTWyiU9G60StkN8QZEZF9a0yQ=
X-Received: by 2002:a17:90a:a606:b0:246:706c:4f54 with SMTP id
 c6-20020a17090aa60600b00246706c4f54mr92664pjq.7.1680906098661; Fri, 07 Apr
 2023 15:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-5-jiaxun.yang@flygoat.com> <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
In-Reply-To: <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 15:21:27 -0700
Message-ID: <CAKwvOd=k6ySaGgHF_J3vnaOpq2+wHSjZ6ab9H5_MmJutCKiVTQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, nathan@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 7, 2023 at 3:19=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
> >
> > LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
> > kernel is unsupported.
> >
> > Detect this in Kconfig to prevent user select 32 bit kernel with
> > unsupported toolchain.
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> I suspect this may fix:
> Link: https://github.com/ClangBuiltLinux/linux/issues/884

Oh, and there was
https://github.com/ClangBuiltLinux/linux/issues/884#issuecomment-1242729142
I wonder if that is preferable or a source of inspiration?


--=20
Thanks,
~Nick Desaulniers
