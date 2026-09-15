Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BB82C0298
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488506; cv=none; b=aW8vaKK4CRgGfSNZjM4F7CDUzKc7XWTAIt21zvPWtqjmz87OLjA2nvq9rUi6BAHlOSu7Gij0l7fiu0ttYMIUEUKnFjetRvjeUyy/8adelY5/ypIi5zM9qiaj4zSz8hu6glNIYzmf2iQIkR4UbuuO64aao7xcoZbyZ6/7t/c6Uj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488506; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhZHgICte8JZcqPLry8vMjld7UYyaFCG1grH4K5faIljCF3AIw9JUSDltZJMBxmG69sGYy/dTDuaNbIkzkoNjMEOCNItwIDEwtF4FmA09xfeFFVOUuvJ1PBY4ELLG3GVMhaYvfk7Rf7/fsCDq4qXSEbiYQh22Ke0UI8BrLATy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ASwjCKB3; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ASwjCKB3"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so2044944a12.1
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488503; x=1790093303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=ASwjCKB3f2eGpykBF58sB5DjlM7W/Dgaj7Tz526vXzztoI78C3yD4jfOE7RLbK/y2V
         CmPPBrkNKs+4nDbmExugYsoTjksQPqw7Oo/2rnA6fB01oy1gSCKqb2Qf3Al5o38kJnt2
         Q86JRsLG9+i9KqpG9uhPLUH7X/NIMA6fUISAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488503; x=1790093303;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=KmBe4+COwJ6+xWGj7jzVYymdbFkCPZTYyzRZMZV0h9euLtxu1RQZM6g0F0SgMeVe03
         ToZ9lqqIQpaNw2VUn775FyMgyKIKuW9IZEwxhZcZIKuR6vLZgPzicOfBHFE2j0hs7mym
         cEkiewBSfd+/YEfjuxu+HBFscyjqpdleyIeS0cSQpRY0V+htf18iBFLo32GHxUIhpe+V
         HOuPeaiC1o0eVeqWiDU6G3jdDuDsT24NT/23s+aLOiVsGG4+EgLuImkghpuOL42KXQEV
         uvKspEfMpV157ET4mn3dPvYJKw/LNJ+eSxrvTkQBSYi68W/xY59lf8MUAgjqoySbWuwo
         Pehg==
X-Forwarded-Encrypted: i=1; AKwUvBydUOFFlEFl5m3K9oHGSGd8jUG9dA+4rQ1vk2v+pjXTrsTyFhGkfLppol9C7sum4gVB1tbNzoO4ZTbH@vger.kernel.org
X-Gm-Message-State: AFuF++ntQeJeAkydZL4w14z+cVFzxo1j/5257vlfQGbVFf+75bf7Bp9R
	SsgQcIkLWA6zXQnWY1gfKDl0POnmTaJe8MWI9L4lkIfCzCYfYmZARk9ku4XU20JI5PBnRn9cIon
	w5+CruvM=
X-Gm-Gg: AYBFou3ENFLIvlwbS+Z5G3YvFEqJlt1r7Ec6zLke/V3HrVqEMtksmulpi2TyMF3HogR
	5bfN+ll51g+/GSIOp1UjnzPpK2NI+TyqtjyRxJmGj+oMsuqfhNPjNjI1et1zP4+z6LE4IjUiBWb
	kxl+sK6+Vc7FwqoJA5wMd6JMeUnYVgVoTVJKenoDdEnFwbGBDLoTWPeun6Bekuwc0eNGehEga9R
	L7x96MgxW0Ro0LaVcqAli2IbLtwJv3r3XvQPTgtpJ6o4NhEvdEOGDoUyA9iztldh7SGyRduc9VH
	6YICL/pAv52bZIDYIGsXnCn51zahLNuttk95JGTD+abPxfdztpyseK1RkJGrmFUpAXDw8OLddw5
	QawdQwlzzQpeHkgtDJEj3rEyAxg5OF587gbE0vg5uefbKug7cBdsNz4/WbCxETZ/6ti31ZctJOp
	n7RJejqMJVEoogQuQLMed5ND2EEJJxZbqidiWvxmkUZhJmTpW2tE1oWiPyJGvHy1CMu2DktBmYt
	JhzWvqEN+Rug5pF+tXQxNlCyHQnoEt45RYPSbIEhW6sBvHG
X-Received: by 2002:a05:6402:20d3:20b0:6a9:f874:6deb with SMTP id 4fb4d7f45d1cf-6a9f8747acfmr3788003a12.4.1789488502851;
        Tue, 15 Sep 2026 09:08:22 -0700 (PDT)
Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com. [74.125.228.95])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1ac1b43esm255469a12.3.2026.09.15.09.08.22
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:08:22 -0700 (PDT)
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so2044913a12.1
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 09:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHiVDUFaBWduNXq8hNXtFoylMOwlqacfu+QkcWIlu4vTws5Ryk6/G162wBJoPFckPF+XF55ABc7j1L@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
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

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
