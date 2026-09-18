Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8B4D4896
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728912; cv=pass; b=pyNTwjCnMtJeuHXQVCDIpuFa2HhdR6tbGQLbaI6zNETxzpv2rV6DBKZIUej7DXcs7821LLYbSeGiAZH43S+0erMnG/s2MkucS2pATGlYL5mSwnsOx+vUqYVS4VImLFRTIYKTLIFx256Yd8BQ68V3uVYCCqvN2EbNBHdPYYDFPcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728912; c=relaxed/simple;
	bh=0QFLY2cyWzIGxwHrQ7HwSGwbi9sjKL2DXLzkJTDdzU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVfRUBob6z8Xu74/ieTflI9bEX6kxMEZAgm/qwUsnDWQ2a0MUSFftvGCPBsTKRaOAX5zt/IrTFlPTFCGMSXmymHWB9Y1faU0haMpD6pWpZjmdtbyTQBWaM0ZIFU+RWcXBWn/Pef+EN/u1GDA3xFIG/KmdrsVa2jD8BgSkdmfcz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azd5WHFc; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azd5WHFc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so73468366b.2
        for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 03:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789728907; cv=none;
        d=google.com; s=arc-20260327;
        b=dlWNIlPvxLAV+pixWncf7/jhEIM4qwixkY3i19yJGK3PpWitC64mnEIkMqtseugD7A
         mlDf/CFPBn/3glwU9d4lFkCL6cO9tZ5vFtjMKtYkDN+Bx86TsDa6d1ehnXR49OxRcqxj
         +cjWZfQPKeIhoW3xzBADkYd9uMou9/qmg2XJOSBuk+Go5PllYxQPF56t8MbxT75y1hwg
         shrofgXbyKj0fHzM4FYf9SstT1o05Xi+9K+IYHzGDEvFOMx9G1WTRQskJeRnA2qUHPkD
         kbsItkPECyzQtxy//uSB4n6FwCj79y603dM+DosADnY8HKJxmqRYlzyKQqyNItZHocB5
         5Zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        fh=Ocx8GjZ5qsAIFo6CwqDzsGQ2c/db7PApY40eu4w+9WA=;
        b=LRNzUSFCPiORbGf96RF+RqFxXXt06+Isql3zvr71Sn4scWU/DKQaacxLbHTnq6dcTJ
         pgNlaUBNzA215xxl+WGulMfK9LfTIxdmfxbEzc1U42zR6QI8p83TllFEwEONhpvy+gtD
         zejuaRX9GsGVTul2TDIAhmjiSN5Dfo44X2ixJzLRwQGYOQ4/mY3FfbetfOJzvEkcwnee
         joFJHcyemlacjMN5J84ehntwDv/tAO982iMs/s4B7tkrN/mM1i4WjrvQuW8mmkFOnNMA
         k1CqQxUHzVVteEIwIbcJCRkXJ65BQyZqUsZXrlXqgUO5P8vTFRS3YkzxCdxA5YBr2uvm
         2juA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728907; x=1790333707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=Azd5WHFc1CvGiYQ9NCg17h0QdQDsKZ1Ic+0GnZXnWRlhTXCHeOt/YKAE0IjeF3RFdo
         mNUlVWWMNvpDH01goCjbtTfi0Wb0g8nlX2FBJGkeqtrHbz9vnW4fm/VQ+kdwbqCSZ1kS
         Oi45Tx85x94cXarLimXLqXpPwrB4/rntqcR3q5+hBllZwHtqJMygkg6UgyHurXqBPemO
         /iVmKyn8SWOHzkRG5ESZV9hfeq3LpxINZGbxIPaCg8OJ0I78rpaQ5l15M18yL2So4NA5
         NCr6l6shtfaJr+Hss/3rPX5iLi+JKMylFgMwfsDg7JxXyd3atCS1RasPfbddZyg9hr7T
         G/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728907; x=1790333707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=QrUIzQWEiuIwt3Kewdoyv3XXwUwBGoD0l4qRgNx+wedrsMbvjrugWn9trv0OjuCp7/
         LMay62+VcRMu4V2RR/tZCJ4KNIk+lottklDeRUU7Iqy/nwpMaBD2zwvxt2YNgSWG2J2x
         MWRYpXGa0LvAtOVJSARJZO+e03IksVEwRtaixefH+mY4MbBAAIEVvCt8OkEbjbLSLL0P
         61+cEZgwgTBe8LDWtGvJPlKiAQIuX4vdQ3Bko4gnjuLNF5+ZG0Q0QnUGCz12Ll0HsVi+
         /O9goo30SytfRbNj2KuPxJIEW7MuCMmmFZ0hEmmjkYEphpiNpmbnXhs1Jxbyg1C8I+2V
         JwGg==
X-Forwarded-Encrypted: i=1; AKwUvByv0doVvT7VG+Me4jvUmok0mOLRhHHvz1fdYfXEHjVU3KduT/0PKRDysPpXDFkHrt6BwN8VsA/2GqX+@vger.kernel.org
X-Gm-Message-State: AFuF++m3hzyjOjsI0YAnlxMUqG8EQN4Qli/g0L/ZJkLLoW7HmdYZN0mJ
	n5fbYRBTkYnlEOoJMGOPXRB1iEzCC2N4aNEmKARGbki41oTOKUPonViMxtOYewVnjqLFGGVcGBQ
	D6jM+omCy6N1SSzNvGd+V+Z1yXILBuVM=
X-Gm-Gg: AYBFou3fmW+3OTUSi7NH1WSv+OuxVsL+MOypQin/qgdOTcsXlzdlp5/XqkkKrHDWnD/
	inOVpk0XufAGbFqJpxMyiaUHImorQ46fvIehrWJZKUUynLWQCEKz7Mocn3mO7iMHQfqZ1ltyVQW
	igImli1iPEcKhf4kwRHvlDYgXJmTZlklQdR0gt0rXoyqqGXH/tKVkFSVqokjBU8ABw7n40h2Zn4
	zX9EHcpilJlA3zyGS2OWdlpJljCnuwX/7ff5j7X5VxXCEwLDZmchSx25uYpZy7JxhoE9Bsal4Rf
	I92yamQrLxW4A6lZPdmSeDhfTWpFXwjM6VFb1ffKdmnDfskjpGjGBC+waZL+/VjP9G01YV+JZXA
	8wtT95fOwymkTxJgakdwHOOx/8Y/A9cNmOL0t4uQIeaxwPSpgPSvs
X-Received: by 2002:a17:907:d0a:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2a15aecddfmr221737866b.25.1789728906928; Fri, 18 Sep 2026
 03:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:54:55 +0200
X-Gm-Features: AcwNN1XYBCc8XytQv7lpPsMdlPdL7ChQXyccU8FUv6otEOv13o1h6_2iRPXOShM
Message-ID: <CA+=Fv5Q+sOLmT0Wf3OGdKw=mBt_EoS8ZQDF3wwGrm2-2vnOYgg@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:48=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
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
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 9f2608de2544..8a85fcf117cb 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -879,9 +879,9 @@ ret_from_kernel_thread:
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
> @@ -896,7 +896,7 @@ alpha_\name:
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
> index 8fc4701a6328..a41276634923 100644
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
> +545    common  clone3                          __clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.55.0
>
>

The fork_like macro now defines __sys_clone3, but the syscall table
entry is changed from alpha_clone3 to __clone3.

This should be __sys_clone3, like the other custom entry points.

I also confirmed this by building the tree at this patch, before applying
patch 13:

LD      .tmp_vmlinux1
alpha-unknown-linux-gnu-ld: arch/alpha/kernel/systbls.o:
in function `sys_call_table':
(.data+0x1108): undefined reference to `__clone3'

Patch 13 hides the issue because the common table uses __clone3 as the
ABI tag but correctly selects __sys_clone3 as the syscall entry point.

Magnus
