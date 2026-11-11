Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382999;
	b=gwBnxhcRuubORxvE0fWqtpQPvzYS2bJUnHaClHWh1Dw1o6Y0pabhj3WPEoEn7ndeRNY0
	 aRQSKFD/wB6ZewtxwnrmWGpRGLcou/8FamGIpu2hxyQxYrmvRFEvYzzhhFHeFniFRU3HV
	 alWAY94ox8JlkhHqjE+JrZOaGaTSy7b9JF3cDIs57W/0MqV0e+US3SXUjCAr5ZuwYxl9l
	 AifJOIaX+eeU+4CVTB6Aql87cb81U93LMmYABVfo9TxkDYVCDrsEIezUEvXps9NsxZzpF
	 Kb1j2o33ty/5MP9jYQj4i2pQ5VrFblITaSYYI+2utZkFMq30S9rwSBbVVtnwZ5+VIYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
	b=iOzIdd/9Dw+MM7yZ1lkpSA2J2H/kICkOTflzjen5AAfrPdKQbBMOBJBMVNIYdSR9DVAq
	 tM0CEbqr8sKcSdxX6BLKLKONrDWpMADuu+us28Fbyrh8/NuBKKn34RIj7MEXOXifPSujG
	 vgcjnSMaJKOvG8otvjFSW1+grhvQJLQyqo5iKzx4vH4bJoOR41eWlKVrueqlcFZCbESD4
	 5pFzWH9ELGIkGG8OUcKTt/9VLbOD5jdQwnnHL5Kh8ddfQoGtIKT7C7DFOKzyi+xGmaVFF
	 f/bCRWGY3ShEPhqUnAwpptipVSnTeqDyMrAULkLAsYGixlIhBikYA6Z0DgvSv4Mkw6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B0606A327
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 07:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E89B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1704781a12.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382997; cv=none;
        d=google.com; s=arc-20260327;
        b=ntDEhB1ZbginRy3KqBaP196eqQir/XT1L7oUwOmVG8kB5lr7fx0om/NKAgARStrqDg
         0MpOU0gBUQFaV9I/QoCnSAezGMVhGAOoKI5RdfHHDAJ01HChhFKoIH2/ocoI2K2JV/4u
         4rPjFjVcQANPBX/Tdm0eWgJcC+Mqfek+wMDRiRX4o7XpuOakdgnwOKacjx/RPrA6eAkg
         4dW8HGp1OYOx5UAo3Zb4KzRtdP2QSFyLx8H2UYHlRdppBY7QFXEp/V15EetI6zi3RQE6
         PZOXdnC8NvAnjUbG6JBLeR5stjyOGeIE692dow0WaucgnxCbXNqXFd1e8SvOdT4Jna3o
         iHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        fh=ENBVej73KCgZ77QrgBO8WWkSdbkXvOHqpS0FWCD1qlg=;
        b=f/tqoH4inQVaERujEO4zrdlBZSnzOzCHWEiTXzhABHohohRguX1BbaJWNRiNEB4m5B
         RCt8aRcHOMfoR4sNs8CxqhvM+MV7rAo+B2NS8/2RrYetT15DmlZKNE5P/ebdrY+feYOV
         C3TlcatoKKIJcz1k//5D/lMJKQwaahetl/+430e+9Vquxlnhp7eRi2vpC5i22ltF9cJd
         RaNta8Otff/djc8vnLkahJNcUlKra0CXVGUIM88c6aUbRePr8RgiJq/fPgDJZ66fZkXG
         /xHYAOGSYTo0f+8QFzNid93ngtfis1B5nBUXkUbe/l0EESEvFQgfPSpF1rOCT1tcTWtW
         gVrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382997; x=1794987797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=h5NQKG5DsH5k0QdRiJVJ86KtbHIpBxOZtiNveHnZG/t4JAkAZl11gGqvbZh2gbx+CZ
         U7R2l09uEN9Mz6txyG/VHZJvSvlNiFdQj+V+bgbOtkQgjiNZU0CA5FMY6smQ/+4XBAH3
         TyiknHwqbS9a1ikRyqP2U11AjltnFdJ0aJiSYxxvbDIdddHQa9rv+KTy80xEhAMzl3C+
         bIpY5WP4LhG5OSEIpLn1ynS3EgjFFWznVldcdS2uIAoKSyrP0PX27WalhA9H67xC1xsv
         oVv9D9PpI4KM5wKfG/3AUYQbehBCy8YKKKaBfMQR6O76UfhYBDJ2qQ9F1ZaCwVdZpUw3
         DTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382997; x=1794987797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=KP8XdRv3yeB3aKCOAp4GCM1v5JX5V7LKTBL1IyS+zKgYjEE2xdjLIZaZQth5kwZiOJ
         dHG9vJW3bQ9cgOoUmrhJy5ReiOJ94bdZhHt1u6ERKf8ETC46+dSIgbdAWciJzvorqKuU
         gVrwrEJmsyVtkWvRvOf6/c5HNalUVeQn1VdS52uA/JPwQxvdWCp+mWvy32fbrjrUdWms
         04xHgC7b4mT3waUpyqZUztoSFr8Mt8seYwpmZcR3M0BtZUFIbzj0BG3/mP96CSq0t567
         Ju+E3F+hRxIy6gm8xXYTa51A3d5BhDv93LKGnTsgAY4ZJ1qplKNlPp6CRCBqlXODIVNG
         7LEA==
X-Forwarded-Encrypted: i=1; AL+hErETGp62gvJRVICVZofrp8DCSqobxYWkXGXqtaY4WraJsyBYM2hZ7V4q6fQPHIY12JYjnR5jxvIilLre@vger.kernel.org
X-Gm-Message-State: APuU4Z+cK+MaET1u5dII5uGWeSfnzSJsgG8LTzNmJEJKvP/BNvXL9zz3
	+eg/X53IfstBWtUNlzIw0ltn8sDQwji/Na4wNEov/zke1dsXi1TgN4o2Mz4/ggBokiMNnSihDcV
	kBR2yU5+catqT+phm9PPNadIen26YzGM=
X-Gm-Gg: AYBFou18NeN+j09LysgvfO7JGh4NZ/P35xJWKyJIGLZ+TJ8ExLPbTDcvNnjA6i7y/YN
	7IZeyEp75v/8Y64mit0iPo0AzTIS5nqe18QPOz8OI21jj0n2+8xkk3+P0jeENsO7LOuvZew38yB
	Lv7ysfqHsVQkYG6oNHKdiq4K1uQEqSjxbiTBeQ3JUrCZ/BJnH33q4Nt2x0h9krTjpFQpdLpJcZw
	mbY6HqM+mashwMa75FnxENTvS9vsiAfQANJe9aF0e8lJn7jOVcCb+/R9RHyuSrW2hyB+5Misbu/
	t2OInq5oFtmMHYuKF9Ij6XlWTSkdWQ3KMm4DSELxxG9U6BsuTTSHHZX6v0OOnbVUJf7hJqnUIJQ
	T3MwV3Lqxy1sbiYMRrBXRAE8S4zMFdj158ZfuYUMWaetiki/Lv2SFlZHPrpzyeB+YRRUh+A==
X-Received: by 2002:aa7:c1c4:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7773edf4bmr819135a12.15.1794382997169; Tue, 10 Nov 2026
 23:43:17 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:43:04 +0100
X-Gm-Features: AclHuK-WWcZzAuRTugYoSHBXz8aDMS8vLzO87BtuVYEGxCZ10b0uUmgcqCUEPe8
Message-ID: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:26=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> Changes from v7:
> - Fix __clone3 entry
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..25d05f45512d 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -746,7 +746,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..59eb066a40bf 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __sys__clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.56.0
>
>

This conflicts with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
the fork_like assembly wrappers and changes the table entries to
sys_fork, sys_vfork, sys_clone and sys_clone3.

Consequently, this rename is no longer needed when integrating your
series on top of that branch. I skipped this patch for my integration
test and retained those existing entries.

My for-next is registered with linux-next, so this is an interaction
we should account for when the trees are combined.

Thanks,
Magnus
