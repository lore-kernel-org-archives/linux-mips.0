Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD44D09FB
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499792; cv=none; b=A1WGbjLToyWKgaroMgpGhxntrP9aa2A9S45luYC4j6uUfgMOFInv60y28OKSa34np53ikfUoSOK2cizZOmeW4ZN/fPcI6VQEIWtCj9DUEOjgOTiNQDMhpecEMnSQfbvjjKGQZQiKyppdgFosGEXYUYzO2DK7mhs2rq1i4N0ovYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499792; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jasSpdnXht3qxHXaDkgvEqYF3BBOV/4h12+JE+0cZMZP7vZusyTEK2VeuaIynyMR6InFdpbvXSB7V7sb1c1qQ/XAvHm72ae1Go89+8OuNbZzLuK7y5zNoafZx9crg5lb/fvx45UcKLKr00+eitysxTIqrNQGqSWluhNstQAYbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aWb6xXPD; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aWb6xXPD"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so2001461fa.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499783; x=1790104583; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=aWb6xXPDIG7acsyWDxk8VftWvbH3LQpm1hIAD/cpmPCzygZjLQzCcXCBez7LYzTrYL
         psNPBQec8j1U78vHr8j6qawGENKZEB4DbpA8Pdog2VWQajjldtsjrXjX5mq9JF7H0Oc7
         03KpYMOO1y4g04UTVKyaacSW5aMPzvxZ0sdys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499783; x=1790104583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=ZvLaTBLr2HRRzbTqo2k5nN2Xx81vO1wDPoJ1drt5kJ+FO6NBqBAaEGmtBRmTxWY7Iu
         6Og75E1+Z8KFbRmEMIrwLZ6bn+Yu9POTicocSNVhvVpnuDzjBEdKF9OdFh1JoYdhPJUp
         aKSSN/KZOoN8VO8RLpd9z4t9m1Kt0y0Y2Gow3FSf5bHGpsCgGNZc10BNoiPwTZvMJ+HU
         8WWaIded4oRsSBn2tUOdOeyEI0NDe17+Plyjz/SHZjkVFKQcfV58+DTrnoegj7hIJbYk
         lD/4DILE5SCNN8eWNA/1nNkNEkAG8AX3vMFGnIrNBS5Ynl5K2q8HCQocGDVd0rq66Ro9
         yvvg==
X-Forwarded-Encrypted: i=1; AKwUvBxjcaXo6b71xAGGJaCaLXlQWfsEECrfRSvhnEvhUee8926rS6PC4xc5tZSfNt3oPGDgCobhlBQuzvWD@vger.kernel.org
X-Gm-Message-State: AFuF++mZdUTmqMf+USjzD5Lkjm7j99x+PBuSoiPZ++gh9lH3+w934DFH
	X+yY8WULxFYBEptz7C3Fcs3QV9InIE6tm48DG9mAcDqDRQGfUM1FOEL3tCtK++2lwqqeWrS9tmz
	PbUka0Lp+7bt4
X-Gm-Gg: AYBFou0LXFOJDY5xNF881ovAuT0VNIr40ufWzEDFTJHfWpMQfaGEz6e8VczhPTIRiM8
	AgjdjrfwEMdjcnx1xPhvmispdu/FnXlS3ZC/VnX/b3DMromEzk8kF+n/tB5LFTn8+gPmt+iEL3N
	ISUaCXkv2xJdUrjRQ8vY5T0nmwzqU+QKC4fXpXzh9ieJNMzkh6ILbH5EwVU5KyKQ9zlp/bO5t1s
	xDlR05eRmGt1uHON+NEtzxWm/N82OELcDmtzxTdFtijJrbNkCWduzyP6lk/Mk0M8ga/wFseOBvI
	81/mfTSK6BwGVyRkbNF6mbDqwe9abEdb16ZcTdhF5sRoZrugNhL0aQTZF5h1OTvdU5gxPqZ6Ivo
	jnXR0mAo0BX1UG7HCyvf8VALzhWzOl1l3W6aI/lawr4B0EYt+LP7t9KR4xgHY5f0RPHRDAue1w9
	bLMN5GYCLvIhHOOZIVSuks/OQxxcQFPFw7HyG0CADcPdtN0yIhLS99KO9MwPRY7fOqZTySqvoUP
	nZciheFC3f4IJ8x5TtwrMqmIo6FjDa1ehgXPpYR+MFg6oP2
X-Received: by 2002:a05:6512:3da1:b0:5b6:1836:8082 with SMTP id 2adb3069b0e04-5b8ae6b9087mr4419694e87.28.1789499783391;
        Tue, 15 Sep 2026 12:16:23 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dae5f0f5sm1450131fa.0.2026.09.15.12.16.22
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:16:22 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so1570061fa.2
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 12:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRF3+bvomdy3IdfYniH8oZOgBmacusdkfTBuN+SoGPzaZY6JM12Dq01j/7pFzVKpzpLZKiDRoDrbfi@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
