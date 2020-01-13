Return-Path: <SRS0=HXhp=3C=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF18C33CA9
	for <linux-mips@archiver.kernel.org>; Mon, 13 Jan 2020 02:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2213C2187F
	for <linux-mips@archiver.kernel.org>; Mon, 13 Jan 2020 02:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=junsun-net.20150623.gappssmtp.com header.i=@junsun-net.20150623.gappssmtp.com header.b="YgrOPDiv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732594AbgAMCOX (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 12 Jan 2020 21:14:23 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:37923 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732487AbgAMCOX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 21:14:23 -0500
Received: by mail-il1-f195.google.com with SMTP id f5so6850978ilq.5
        for <linux-mips@vger.kernel.org>; Sun, 12 Jan 2020 18:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=uu9cpveCjC++SwrXuVfI/d2rBW9dQUNmew56IojSvZE=;
        b=YgrOPDivmcxDLOeUPrpXDmild3JZE+IHxwhsPZBYvB2PynsV1T/ooGSe5hK+o34FE1
         Nji8UZU0d6Q0ZBShXlNLgB+NGaROmkLZFZNoAk5Hlz5t41xRJ2lEzk1Qxs2teg5DhYGe
         qLbgrszIo335WULK5IcQXRmMgvh8BiRcTP6FWpTlBCppBghPxCTxryrlzX1zEYCPPige
         mftzBmJe85/yXlx4YuCtuIcXR+DKQYxVnSTo1BMpteZ4q143bz4DuySzkj5DZFYLaCNC
         3GH23v90TAgG/jaTzB6IeeoivlAxz3EaEu6EFvRaW+XHtnavMa7KblwW7S4mCXzI0qKV
         nvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=uu9cpveCjC++SwrXuVfI/d2rBW9dQUNmew56IojSvZE=;
        b=UCgNeoifuMIVZalPM8EtwWLnmDP+6tMR40Cx/v+JozMWVd9yvvBMLjsqXKzydVNPqn
         RIDQ51zR+0ve1+zT9poULQEwj0kICyP0YEOfsazm44gtTN+cnXCGlbclafaNOMi+e/C8
         pfVzfZFLENCBXHTYQ7Z8KmN4gjXMgr8wTpzf4GeEewyDVkUpQ0pcMCqyB0UdKw+dfegw
         keiyviCOIjNIEsJEs9W35xA7JrsdD0FGi6+Aah7HU/sCpDaNKliLygCKXsHtgIPTDfqi
         eQ0cuAmXH4S55qJewpB9VKc+wmWvtYiYHzO36wQrEgKM7I+OL/ulsWKzggbJ9XO7io0v
         iTWg==
X-Gm-Message-State: APjAAAVrdsmPeQgbMH4k/J7UXIgy102MRyTwDnjuU8lUInutlUQH5m2L
        nzSPdUHouPgfMJtyYTc1VNYUKQ2PCQVzFIisUwpyGg==
X-Google-Smtp-Source: APXvYqxcaFqdU6ucVK7O5mIP9kYoA5blOqeGgnqOLUqHciDCgSYiJC0Ua2N8r3KC9g/fac3JItTAa4ZEX1D9eODKDqg=
X-Received: by 2002:a92:8f4b:: with SMTP id j72mr13385664ild.1.1578881662652;
 Sun, 12 Jan 2020 18:14:22 -0800 (PST)
MIME-Version: 1.0
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
 <20200109212404.GA1750666@aurel32.net> <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
 <20200112195752.GA18154@aurel32.net>
In-Reply-To: <20200112195752.GA18154@aurel32.net>
From:   Jun Sun <jsun@junsun.net>
Date:   Sun, 12 Jan 2020 18:14:12 -0800
Message-ID: <CAP5Nno5jXhgbryGqDX9j3TAUwXmsBnRnvNuh2MJpDHs-bSG1Cg@mail.gmail.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     Jun Sun <jsun@junsun.net>, qemu-discuss@nongnu.org,
        debian-mips@lists.debian.org, linux-mips@vger.kernel.org,
        lixing <13699171092@139.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

See below.

On Sun, Jan 12, 2020 at 11:58 AM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2020-01-12 11:34, Jun Sun wrote:
> > Are you sure QEMU/MIPS does not support SMP?  Below link written in
> > 2016 clearly shows something was working then.
> >
> > https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-release-6-cpu/
>
> It's not supported for the malta/mips64r2 combination you are trying to
> use. It's clearly possible that it is supported for mips64r6, but it's a
> different instruction set, so you can't run a standard Debian
> distribution on it.
>

How do I specify mips64r6 cpu to start qemu?  A simple cpu listing
below shows no such CPU.  If mips64r6 is indeed supported with SMP, I
would think mips64r2 userland should run fine.

$ qemu-system-mips64el -cpu ?
MIPS '4Kc'
MIPS '4Km'
MIPS '4KEcR1'
MIPS '4KEmR1'
MIPS '4KEc'
MIPS '4KEm'
MIPS '24Kc'
MIPS '24KEc'
MIPS '24Kf'
MIPS '34Kf'
MIPS '74Kf'
MIPS 'M14K'
MIPS 'M14Kc'
MIPS 'P5600'
MIPS 'mips32r6-generic'
MIPS 'R4000'
MIPS 'VR5432'
MIPS '5Kc'
MIPS '5Kf'
MIPS '20Kc'
MIPS 'MIPS64R2-generic'
MIPS '5KEc'
MIPS '5KEf'
MIPS 'I6400'
MIPS 'Loongson-2E'
MIPS 'Loongson-2F'
MIPS 'mips64dspr2'

> > Also, as Lixing mentioned in our private exchange, there is SMP
> > support for loongson.  Lixing, I assume loongson SMP support is
> > already merged in QEMU repo, right?  Can you point out the relevant
> > source code directories?
>
> Lixing mentioned virtualization. In that case it is indeed supported
> like on other mips64r5 CPUs. For that you need to use add the -enable-kvm
> option to the qemu command.

I'm not sure if loongson support has to be kvm.  Maybe Lixing can clarify.
