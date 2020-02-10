Return-Path: <SRS0=D3Xb=36=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26A8C35254
	for <linux-mips@archiver.kernel.org>; Mon, 10 Feb 2020 19:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77C2020661
	for <linux-mips@archiver.kernel.org>; Mon, 10 Feb 2020 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581362971;
	bh=0qTa4TRDYZ8AY6zlaBmuDXyqy1uqssbM8XDoSP+4h8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ih8qHNBz8bG8Tjg1WeTHSI3G/z64SG4kPKYeUgWKhx4QBCD4Z+tNjmzDD4kq8R4d1
	 sm1L+J+nrqOWGEVtKN+sW8/4C5Btoidcby77WfIERZtQpjNM/eVg5k/R9WbYn+AxRo
	 Kqj9WqGMdlJuNwDqSobpXfC8yJ+Tf15TyJb8o6fQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJT3b (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 10 Feb 2020 14:29:31 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34092 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgBJT3b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 14:29:31 -0500
Received: by mail-pf1-f196.google.com with SMTP id i6so4205576pfc.1
        for <linux-mips@vger.kernel.org>; Mon, 10 Feb 2020 11:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j37NIOlRl31LvW3aUZuWrjxfbazy5t4/yzcU4BimROo=;
        b=f443u98SmstCPvrvSvaF0SIH87jpCxxXxpEFYXtHmwSXQg0f/xuthMni4GBMWxjfy1
         gyMjKLxhGNn0i5NsgoRGwd78uRi0PgmxDDfyxJo6gjsfb7hViFf+Gq2/VpebfrlCytXk
         ENXt1iIOlEExdOGV1KxUsKWXYpuQKQmqyATpriuoLBgRFoQYAYZSArlhKcl0lxLHY+j1
         /OHZVyr5Ow3+vztWldf70PvavjIp1pnFBmNkpzPetfNBfLD+COW4/JUzmLAE3b684sEf
         W6II5RgP4TtELVHC7g1rv1s2ZTPQyoGKoCK6C9lY7CPV4seUVio5HtuG++NOehtEz9TC
         K/Kw==
X-Gm-Message-State: APjAAAUYxyWC/JReHTV0Dy4ef9H74NwUXHDOGwusVibk9WUIUEDFb7xX
        0VDoqjtNPwpD8x1hOdYkv9E=
X-Google-Smtp-Source: APXvYqy2b7huQzjR6AfH7sDpyxK8NsRgnWlH6reP86MCDeoeyuceddbiLR8VtrTznm91bu/tu2NO4w==
X-Received: by 2002:aa7:9d87:: with SMTP id f7mr2553903pfq.138.1581362970192;
        Mon, 10 Feb 2020 11:29:30 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id f15sm914892pgj.30.2020.02.10.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:29:29 -0800 (PST)
Date:   Mon, 10 Feb 2020 11:33:01 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Victor Kamensky <kamensky@cisco.com>
Cc:     linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Message-ID: <20200210193301.ella5mokkudw3qgs@lantea.localdomain>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
 <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Victor,

On Mon, Feb 10, 2020 at 11:14:24AM -0800, Paul Burton wrote:
> Which kernel version did you find this issue with? Could you check
> whether you have commit bbcc5672b006 ("MIPS: Avoid VDSO ABI breakage due
> to global register variable")? That was merged for v5.5-rc5.

Ah, I just spotted your detailed cover letter - my bad :)

Please try moving from v5.4 to v5.4.18 or higher, or just cherry-picking
the commit I mentioned.

Thanks,
    Paul
