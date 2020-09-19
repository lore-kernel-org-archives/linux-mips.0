Return-Path: <SRS0=0XjY=C4=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E72C43464
	for <linux-mips@archiver.kernel.org>; Sat, 19 Sep 2020 19:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 541C621D42
	for <linux-mips@archiver.kernel.org>; Sat, 19 Sep 2020 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600543126;
	bh=QMbBSSWB+rPWNJ7EMIocj0WPzEM7MxHjK6NIAgERVjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=S+VdPR65GzfoHiKnJBPuC58V6faAcpx0r2JCx8zSKUfXAhRoX3abmLTuDlOIoPwX6
	 nNtbo3HxoKbIICZ8C/w2O7P8dRUzc0C9F0c2mFsX7XEX2j9kEWqKlR4qFlg4Hox+u3
	 qNasaxkQlPgFWTA5aK4svoB/qBGOurL78NWbiiaU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgISTSq (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 19 Sep 2020 15:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgISTSp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 15:18:45 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55357C0613CE
        for <linux-mips@vger.kernel.org>; Sat, 19 Sep 2020 12:18:45 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z22so12445626ejl.7
        for <linux-mips@vger.kernel.org>; Sat, 19 Sep 2020 12:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
        b=SNvzyY/D28nrQ/9in1B6Dzi002SQEpeIWQ8e1hzmI9hVRDCDcHjzeJE8AlbYJKjj8B
         G7NnpY7h0luEeygyoDxqLDk2AWGbQCdyloo3Y9XIxWLvxZdXjZ/NeK2kaD/mL0YWoior
         T+0jhpZUK76WT2Sz7na41qAPiBNog2OUpnoIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
        b=eg9tMfsB0QaspvqgNfSperfwDSXLOo5zqYjYTcArynnDEPJFu6dtrtUur0FhgO17z+
         zFAV9S2PsGbGdFoPKDPVPcJD86dkuDrdssjR6MLDCmFtlTwOxNiWtixNzQNZP46Zgkz5
         tFPLv1o0o0MqyA9Y0A6uaSOXMZxmoYC87rjijXGAgq0oYuAcjxfNyxubjwgetrGdqfRZ
         3yy++5rkdaDKRZomF/+Y8F/XpV7t5wW6mUAqda8Z9jkX+rRhQKr9Jz8F6DWpn5XujKoa
         0BaMaOQf8qOh2i+q3U8tjTUo/DJMdmMMr5DxB1+u+K09ryCSPej6mjhoCUqf4XQUnXUm
         10EA==
X-Gm-Message-State: AOAM533jRZCjFinFgXEAh1hdt7DpDN2KqbInsIn7VbF3bDBgOvcbhL/Q
        YwOtOFwtIj0I0QwcZ0TzFEDI+CYqsMGGfg==
X-Google-Smtp-Source: ABdhPJz/wxLVTmIsFAGUzgiEG7oY4LkS8bDxzXtrB1pY6ei5sCh/9102dqXfG57ZwEXz/aJf2mAUhA==
X-Received: by 2002:a17:906:b784:: with SMTP id dt4mr44622119ejb.376.1600543123701;
        Sat, 19 Sep 2020 12:18:43 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id l21sm5198763ejg.124.2020.09.19.12.18.43
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 12:18:43 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id t16so9172306edw.7
        for <linux-mips@vger.kernel.org>; Sat, 19 Sep 2020 12:18:43 -0700 (PDT)
X-Received: by 2002:a19:8907:: with SMTP id l7mr12464193lfd.105.1600542797553;
 Sat, 19 Sep 2020 12:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de> <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <20200919173906.GQ32101@casper.infradead.org>
In-Reply-To: <20200919173906.GQ32101@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 19 Sep 2020 12:13:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Paul McKenney <paulmck@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 19, 2020 at 10:39 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> My concern with that is people might use kmap() and then pass the address
> to a different task.  So we need to audit the current users of kmap()
> and convert any that do that into using vmap() instead.

Ahh. Yes, I guess they might do that. It sounds strange, but not
entirely crazy - I could imagine some "PIO thread" that does IO to a
page that has been set up by somebody else using kmap(). Or similar.

                Linus
