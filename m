Return-Path: <SRS0=5AqY=AA=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5262DC433E0
	for <linux-mips@archiver.kernel.org>; Fri, 19 Jun 2020 19:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22451206C3
	for <linux-mips@archiver.kernel.org>; Fri, 19 Jun 2020 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592595748;
	bh=u7Q+9lveWuHW5aLyR3G8V9eIOsfyptLC0kbPADPFrWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=JovWybyFp+Fjkyl1cpdgqlC/IfvzFm7TLJxRXCkIaRd7Owis0tqPDH6f337qXXUwk
	 Wkb+FNVkj0E9xY2kyup4WA0gAvoGGTUqimL4h44BTm7XscsddU39izYePxQhO1rnUR
	 P0fYOyfNUy31nu03Fv0bXWe1toJS6+QD4QokdkAg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389974AbgFSTm1 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 19 Jun 2020 15:42:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389687AbgFSTm1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Jun 2020 15:42:27 -0400
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99F66206C3
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2020 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592595746;
        bh=u7Q+9lveWuHW5aLyR3G8V9eIOsfyptLC0kbPADPFrWQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sjMuI2k5LnSDBQHixU8X+Wt9nQph+at6Oenp0L/mHoX0a6okbEocQvP+kub+ELobb
         jBS5ODQUzGGPJDcgS1iI6wVPLkmKPBlup8JbaTHN9QXhyYFqr9UuxFUxOczlDcOOso
         VfPF5cETeyzJBik4k2r/frMc/+bkQn7obx5HuEao=
Received: by mail-wr1-f43.google.com with SMTP id q11so10820039wrp.3
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2020 12:42:26 -0700 (PDT)
X-Gm-Message-State: AOAM531fC21Kn8yUzJwOUFmCVrby9cJNx3NZTdVvqHWDaxsgWjRus0PD
        TyZr8PRD89g1vqv2KE4hMY04s+Y6racCKOmEDSMZ3g==
X-Google-Smtp-Source: ABdhPJx5azSOHLfoMlVfQaoY+OUvFQy0JEKqZUc1FxYz5irmT1AzPU+k9GiBgkz9x79ch9sgMeLhdc8wqHh6EjJuqC0=
X-Received: by 2002:adf:a111:: with SMTP id o17mr5623209wro.257.1592595745224;
 Fri, 19 Jun 2020 12:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <202006191236.AC3E22AAB@keescook>
In-Reply-To: <202006191236.AC3E22AAB@keescook>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Fri, 19 Jun 2020 12:42:14 -0700
X-Gmail-Original-Message-ID: <CALCETrXM5gneAC40RLWyjnCeHE6JFVOKnM0ooKLooGGaVV1KOA@mail.gmail.com>
Message-ID: <CALCETrXM5gneAC40RLWyjnCeHE6JFVOKnM0ooKLooGGaVV1KOA@mail.gmail.com>
Subject: Re: [PATCH] seccomp: Use -1 marker for end of mode 1 syscall list
To:     Kees Cook <keescook@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, Will Drewry <wad@chromium.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 19, 2020 at 12:37 PM Kees Cook <keescook@chromium.org> wrote:
>
> The terminator for the mode 1 syscalls list was a 0, but that could be
> a valid syscall number (e.g. x86_64 __NR_read). By luck, __NR_read was
> listed first and the loop construct would not test it, so there was no
> bug. However, this is fragile. Replace the terminator with -1 instead,
> and make the variable name for mode 1 syscall lists more descriptive.

Could the architecture instead supply the length of the list?

--Andy
