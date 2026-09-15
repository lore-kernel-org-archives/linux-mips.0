Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8EB37B40C
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512918; cv=none; b=PwT49OiqJTxdw783BjC1NU9PF3KLPEL0sdRIihqRU9XcHvJp30bbX54YgqCz77hKz0HmywrvQ7vxlCL/qe8+qqstYoBuxKJwg3cm7+1ZdWFrcgZLGWBlutXraCxgt488GVNO8BUYE5mLMjP4RylXvsD0GDsYDgI3kQUvM3Eeqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512918; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+olP/kGuX0yech4112j4MWeniuyA3Gl5pljWy+Xgoi04lcYtpYi5GzkAxo2IPJ4mAV9SrnQLkgNr+xS8BWS7zJ1ep4KPqCXkYBTy4W+QkCPzI8BONAXbxBsVKcvBk+NZwQMF64049J3aBTwtjpbGmAzQYt94DEQs2KBjpF4YLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O8zInPWI; arc=none smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O8zInPWI"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so47400166b.3
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512914; x=1790117714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=O8zInPWIdyxyOa5FLkMPUHA3YCGWIiELKOQ/L6484wNxxTf9lTsXdbe5Jtu55K7Q+P
         iy2mxlVKms3E8wCPHNo/6//rHBOqwkZxyHIA/DGNKVacM/d2k88mwpsHwLM215I56XFw
         eB0PiNUAr8DA6jrTxjB3eiFi8KrMYLE22XljE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512914; x=1790117714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=x9zSCgl7FRKW2TCtO3Y3juZUOrUw8TV7xmyWAxyOn7cheBtv5ft1zlmMawIrRmzgAZ
         tH3f1HRonJztMPk3pDWLMy5f4lmHVhVfK9WEMcrxkJ+Urxd9MVOrL2R5cSiprk6hOBSq
         RkVer23SnxP1EDMCgvoYam/JScJrbR5CD6sVgWAfoPZCx7fECJ+Aqnc9qlUkiQ8c6ktE
         MipTglVAp24gmcSJOJXGXiJ6msDf0C7p/biUS9xzqglxKYHxMlH6CFpjQr4d5LZId3L2
         1MC3HsaruhXL+CwE3Cj5GbPsoGz6GREHzyV9bd2WvYD/UmRxDKXIs+x8O1cUQvPHlo7I
         AqaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN7gtaEVHuCJ+Y2lOvjmt6Dc2MG2ANQn1NTUi2dZV9C10e6lKR5EY4kX/1NTrkuaXhx9/LlgwZOZV4@vger.kernel.org
X-Gm-Message-State: AFuF++nQlYdjIUyxj9Pt6mo1j9/gbYdnm2qsyxOn/XKkKdAYou4jX4hz
	fj+IjAvgeqepadYo0nNc2/wknJRWWIAdgsid+sw4930+TP/n8g2TATPPrrJBSGHYNOIiYuFprUv
	bpSt1xt+8TQ==
X-Gm-Gg: AYBFou3SQyEBgz1/4OcoixPbto0K2Hu0hXzIaDvtLOta6adgO7EOwXIuqij38zgZN3l
	rSHqYrxUGkRyKpLEpGj0xRE7HHQIqo3caY1dM0f+xV8+8s+/wIt8kME78y9VLGuRmvMKnG6x7bg
	U9JQdBovXajvysEDKMmQkAmHgGOojL1/DRK+RWEHtRvVTYF6oZh+zI5Uqtf33/JUZiebd9w8Ggj
	bVlhWFog8NqAF/AqJqwGbrUO5DYkjnuOtUwOJsPvXmDCkKjeFYne0rbZgfOAkTsQrEZvM9s0P8f
	CHUYSHkd6o4XSM90gD8geprNGKMyraqiuT7+1FiVt7EF/8EW7R2iKtPppAr4xUIf/GxNA36SqLS
	tM3zN/NPDhD9iQKxBocWczQmyBwYXRBukO3o70lnVPYmsYNho2C/k4Cotj0ewtgW1j78NBLR5YW
	l/zEe0D7mj7qyfXDZDygaILeqAGvgD3nuu5v+27ziYy2+r0csTaIYMqNCacf/FHEEb29BMTcrka
	jmFzBMv+5EmG0mwMFhyxv0bFtQNU+WcxSdMtDLeECZbJIWZ
X-Received: by 2002:a17:907:944b:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c29e5308620mr8814266b.35.1789512914226;
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de082ac7sm34174966b.7.2026.09.15.15.55.14
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so457265a12.3
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVbHtAS5YL4yRo6GTvfiy8NTpP/RdbvWtXzq8LnZ4y83KxH7XEJcsXEp/irvC75X+yHPWGkQuIu0Gt@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
