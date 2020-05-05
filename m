Return-Path: <SRS0=OguP=6T=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74BEC47254
	for <linux-mips@archiver.kernel.org>; Tue,  5 May 2020 16:54:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC888206CC
	for <linux-mips@archiver.kernel.org>; Tue,  5 May 2020 16:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0OmBMiN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729697AbgEEQyG (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 5 May 2020 12:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729310AbgEEQyF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 May 2020 12:54:05 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E30C061A0F
        for <linux-mips@vger.kernel.org>; Tue,  5 May 2020 09:54:04 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id w11so2116813iov.8
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2020 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CQPV38VFHq5jUdj3xuK872aLx1CmmM995oAhTR/zeg4=;
        b=p0OmBMiNRcbZeEVttRyrUydpDTEXD+loILZwadE01yiYrZMAefBa5lEnkCd8IE/f1C
         wqtNt3itnutwU9SNyU/Y0fQOnPrSFTEoDV1obS+naK5wdvSAbwcozgcVIGkY/Otjnd9p
         51XhOstTUsx5ISmBzOTD1jNv/oS5q27DmqmWhYSeqm+5U94xAJaIyLgweW34StzfEErI
         3dfM/v0XMGcRAFe9bPtoLVFLg5ACcy1j8Rnan0JmxmJvsltfDo9KWXkcjYgZK/TvXSRC
         Oh/P44Cii0cxHTkyJ4tN2a3504hNbCU0BEhwsSTKenaJXoMTLVbgu3JdVv36Y/5fs6vB
         BO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQPV38VFHq5jUdj3xuK872aLx1CmmM995oAhTR/zeg4=;
        b=c+4qjm60IOIPhaVMUjaZGG2iH60lEfZ05fQJX/NiulW9zd4Dqf/P1Z8yFylto+3pIl
         obOL/r0Mm+HiO5ywmzWm8ShEZIIBOvZ1hUp2toOKMy+aG5VcQyhaRTisyJnL52xfrTJu
         /1GL4atLgDaPTjysOchLoqTO43HpJ4Kdr2iW8Af5vH2RUpa2Uxke243v1r7S/rEfNW4I
         fjMLkaYLslE9Pf7MAGSzZA9Z0+GMraSSxRl+P4AF+aBYYL4UzMFN0GrGSGy46DGbadQv
         DSMAeHVn9wNrgH1pRc8gbNE7oJGQIia6JeFA4iGBmefHjJDOldp3YQHiozzk8MWFWi8s
         IG5A==
X-Gm-Message-State: AGi0PuYLXJsYiAEskT3ZhXoOtpo9e93By2ZZRXj0ju6GBPJZpkVf1cig
        vsfpnhci4dOAGS/V33VyQbN6y4eUqtQdF9GiG6OPpw==
X-Google-Smtp-Source: APiQypIh87tWtIMtuteWC1af3Q4H+FkjslZ8xyNvCG2aA394n3dc+bOaNgbwVm/hpp4CR/gsTCwAOETr4pzr5lry2Mw=
X-Received: by 2002:a02:a004:: with SMTP id a4mr3700717jah.18.1588697644142;
 Tue, 05 May 2020 09:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200504110344.17560-1-eesposit@redhat.com> <alpine.DEB.2.22.394.2005041429210.224786@chino.kir.corp.google.com>
 <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
In-Reply-To: <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Tue, 5 May 2020 09:53:53 -0700
Message-ID: <CALMp9eQYcLr_REzDC1kWTHX4SJWt7x+Zd1KwNvS1YGd5TVM1xA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc:     David Rientjes <rientjes@google.com>,
        Jonathan Adams <jwadams@google.com>,
        kvm list <kvm@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 5, 2020 at 2:18 AM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
>
>
>
> On 5/4/20 11:37 PM, David Rientjes wrote:
> > Since this is becoming a generic API (good!!), maybe we can discuss
> > possible ways to optimize gathering of stats in mass?
>
> Sure, the idea of a binary format was considered from the beginning in
> [1], and it can be done either together with the current filesystem, or
> as a replacement via different mount options.

ASCII stats are not scalable. A binary format is definitely the way to go.
