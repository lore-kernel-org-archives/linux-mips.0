Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8537043B6DA
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494730; cv=pass; b=F5k3WCwDwhF00WfBggirTzPh/cY9inkjV5DA6Xrj3YA+FiSRGjFFVTR0VU/R05m8H9KpeM6IydtiOeqgcsdp8QdFDHKax7UbuV/V+KG3bZrDGNHx5EmgTETP7tb5ziF7eyjoeNMWeDoCl8O6yj9Jmz1BtmWjEGPlzbcW938145E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494730; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlrROPOaIf6ZNk0DuYf8hNbE7XUmPsEs3+frc/PPPWqLjszXAF67lPl7TKmiEJ7ERaVpyBu2eMBVfjKjUFjO+zdtmgi1HTZE8k8G7b/AGcjbEgizgyqIL0AZx9dbrbwgeGqMaakQ+qeo6XHu4e91cIczmEX6YLwm+4Zr6z93lGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so12035ad.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=J1hl/zpBj0HwHW1MWz7LfwQhS+PiEtpBAUlPeVvnzg8jLJAwupWn65q/bSM4eexeUr
         doOrj0LDPuxASzUtfXw1SzIje/n1jPgS9+BKD3WNUcK/7YTatcw4/Z0EFFaEnXgMQgTX
         IKT0N0RMPW0NBnhbL7f3TUuqzJTkVckTxIJM26woAKFuvO1vvRQqsPsntVfe51wdksHt
         qQWhc2bgEjklRau+vFJR0hjqB9pXARdVKDl70K9wZxgL4yRsY8y6+Is0c/FeNCvKiO56
         EuDs0A4X0RlHLiPlw7Y6qeQGrQUiPr2IurTL0DrMRauJUyn8p4eFHXrOL9SDAwongtJJ
         6d9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=g/DHNWF7xG4KcZDFB4b0QvhU1EmhuSKPTboIzDa4vI4=;
        b=lSB4WsBXflznm6MgJbjte83Gwyq3mMzKe/XxrDOGsvI9AIVM06Cr/8wXdRiPt2ZCk7
         MXNufDnwKk+pRaJAzcCE9TLfO4+dhXnH/87m9kzPGAi0svUe1nZOXkC3Pmrqg8vQ4ZVV
         Z2rEVX469WvfcnseHxmYu3njEiKIjWlM7B+zk7pKe3FBSVfCHcRqArawrC9cpsAQyp+O
         OnmeksmP1XgF5Gyqqc3STODYbL45TfRtOd+nYpFMvfTjlZvogg/yt7PY69M8ObrXy8mb
         rA9ay8SWqB3UvmGLuQO1mZjBeyjQgBqRjgW4pm/hPWzGsUHPsFqpuyy3fZAn0ltvpaIo
         peSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=S3FA9jrsfQEWWCZhbOxxSR3xDwZ3TEu/e4sRrIG1fHPVNnqxh8aHVhipcp7GQFhp65
         sgnqTS6Z9fVV1XVX37jWAvx2WC2sUbbeIk/DN7Ldk0gxLXMbjVV0nw0MNGhVEQ4ggIgI
         WTzg4u5+qwc9kYPnXX1ANcU2aGvtCsCz71ihJcFJcuePg8QaOvpOaah98jzie89CR5QE
         rttyFnVgiwmT4qjr6WBovVAi5+h6R+UrITNAKvvfnbshuAJoEqPWMbV693wkHyoA8mXm
         YRJPVVWiU4dXAuM9DrxsjKw0JTPwM7tUHRmBrML7XRJ4byg1EtDBfKjvx0O2+GhJKMkl
         gX1g==
X-Forwarded-Encrypted: i=1; AKwUvBwF2ikUMJpnBVxWVzRqHzaBSGqPBrb/mie13D0kLmA5eY7POR9blxVBayKaxBOioVETKT/KoWWq1r3p@vger.kernel.org
X-Gm-Message-State: AFuF++kWEW8b/5u4rjgKYIWFXIgwLCs+IeCqGXQ8kqeGzeRjGcrHc0Jq
	lUka8Ek2xYP5UgbXIFku3I+eSdxPnVscI3ltvykXXuZfkFy3l09tzz1bsZKFqczw2sboCKc1CM2
	w9vuciQ1fc+ky6mHKH7UucM6OW+u5zwkI7U3ex6u8
X-Gm-Gg: AYBFou2UkeCt1pwskIXVsRYHyub2VOsr4G+KPNr3RrQmzHHT25TerHwhimeJP4GjyCC
	2fqvs+APlb8Xs+ck1HZf/gai8tbXCoWKJhEIHiA3di5Ree6lZ9f8dMFpT9J1P3ryFROWZ4JPEnH
	SuaRRRRfVCqlo7R51ivEJ5xMo+BFwmL//ZpWXd8+87pw7SGP+pnknnR6HsIzpbU24stxsJM57y9
	xlekuK5RQnpPi8jpCPeOwo1v9bJAtFIrai6JwaUSezE6v4jkluU/qsa24CjNS+ovxBMxsdSodKI
	j7H1QJOfnRMhBDrSNCWRzI9a5lLpicPuaj6p7AJS/xlqqXHbyTa9IWtK7YzpHbmAS2hS2JItWFi
	gfNthEb7+6AEF3KhW+ohP1CFIc4SYJanGNKfjSo11yZiPkgENoHI=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
