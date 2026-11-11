Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794383492;
	b=xgwNaHdwhjwHo0MvgSa1jAd3DvHi94hD0sCn/qVEB/Nz718Oklp+TjEM/xzUX2CWt2mi
	 5pswAxwVIOlxxCTYeiOWD+EL+5j79fIIw9j1Zvb3QNn3M+RUhhC/2FCBbaC6av24re127
	 Nxm5oKv1MSSo3P3D38GJfvXUDB+ETTO8YVB4mpMplXCktKtGwUFSFyNopdyyHJIGxUIYV
	 UPDc3JIkLDv/79rYu5XylsfVU0p1XA9wp4VlVPCBVBGjgtUzV3MbBg9qvtwqvcDob2D2p
	 AGyJuOlRfVC87QhocP/tEgAoQhXu5Uj6Lj2HLDdxyG1pqoTfprgZIhUXqjYNmftyScQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
	b=mxbG/SwfhpH9POPo/m4RJfLndxt8ILhu6tGHDqejYIUxEWbHovmVmYU1zM6WUzpbQVT8
	 b8vejGAQEE/tiUwMnvVlvB2QkFdy9aGskVK2bOA2aSyoE/WBc+nMThjdRTk47HYLYZqp0
	 QrGzGFWLVzYl+NgiXvkBqYm5NC0T2wYrN1Y8QjMWYGcTpM8RXDl6v4vn6Dnvi72FkgC0I
	 sqGqir0JouCo6f3h/SgINOa8gP6AmpEuKrrLbcFmD1J4nxuqGkABMqe1dmU1/eT33OUk5
	 UL/hN2zqF6BgEIJX+NWGBzwIhNRhOgO2/krt0mj0YQsBYpB3+NWTW/N7lej+jJYuAYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=md4l3zAY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD2606A327
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 07:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41BD2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=md4l3zAY
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505186727fso207015866b.3
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 23:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794383490; cv=none;
        d=google.com; s=arc-20260327;
        b=k616pW7L+9R7wZh/kwzf/9kWeOl7V426AMCFFa33xhRiL6gGFIGHVI8xaybTxeBxh5
         HuvRRF+rFmj4BbI7tnOkLlIQVfPDAKyLzznfs9PvrGroX+52CuYCw4ayW0510iHh5lxT
         OI239Yl7uSoh0jiQZftHvn/yLcwnIr4WyLjKBHcT7b5dXlcs5bitJO7q//9JT+QI9Hdo
         mQI7GO96DQhaMAwM8TWKf0rJHyz1NP7aAzSXrxlo/Bnipv/shcxuNnRDTeG/hEZfFGpd
         HInniYP01ZwjzNqaqmDtOi51QWTIUNsC+cOKVs6IfXax2DCIsTiGUOyZsyKgWdxmJMoO
         DpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        fh=jyqBkShND8498VNN6269sTfp7NmQaqn5ofq0oFYO9O8=;
        b=e9HHegBYKByjfaVdmua8v1ZPoqzlxnSf4gUDZkJodw+Jac8I1L2tKop5v4mm+4lfla
         Mit4kJQCHC2ivTdUM9aX63lCqTmhiceODrqIV2rB1Scxnf7+rSL6bDlJIokEPcgGUXeX
         0xFVhrmFEZzmnAuobnsjP5iCVoqz62tOFbm8DAUcd9mtH7pI7lFbMldzedZqk4q003on
         4ugmAyJsZ+usVT9eG9PwAXzxWTH5SLeg7FJgxGiF5iCyoUzKiGBlv6shnvJ6q6MS6gJh
         xbuEu5EgWgJb49nGZAJkWCL/QZpdtiQaDuB/i2F9Zt9MSj2dUlqg3HR5zDNPO6FzwQM7
         dImw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383490; x=1794988290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=md4l3zAYv1zu9HhijK+oX3dpDB6YUSeOKHdEMKTuN7pX+J0HNpZQaAtuo3AKBkgH7s
         Xol8EfdG076x931RcDKNcJMSnMJqRR9zy2fns0x48pWylIn+nzYcFB3mqKrdNbi2xkgq
         W9FOovP9uE8OulDKq2Mr+k7s0oo6YxvtxoWjuUd8CwzVieGl9R+IqZ8ZhCK4zSe9dF7B
         vQpHxeF2Vo9uDifi6j0iiemE6/GzaxofZXrrz2bF5g9h7P/Bww+w1X27r7PK9XQa35eh
         70AF3W71JWv7eNXpZwiksuer5G6PZ1mIkog11t93J4zqczq1jX+HjywgfOx+nUnWwkf8
         bVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383490; x=1794988290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=oAOUGSPQBWcunSdqN07GFR9tqB7rtS+wyuEG3rqzWjzj3W7rRoc7a4lx9wQsnal70x
         BgRsjTbXKSlceyjrUy9HFcxyjHtyL3tTw7DwizldQ1NdUaQDZzDwhg6h75hGIb9aWFln
         b143CtiqK8valmcuM3PIiFMubu8vgEn+L/CuWWYIpHR6Z+tkqgtswnAQx3iHTOw0BhMO
         iXCkEeYDSgH+ay5cxWxVBfRB/HazrvC/u9dIGerXX35v+h5f0DY8RsUaPN3k7k1P+qEH
         MHihUTc7yvm+OpJS3H41nFwXrsDxyrxG7yi7GDJ23M2jbGhLwEYhsfiBh1jka1bfj8H+
         EzUw==
X-Forwarded-Encrypted: i=1; AL+hErFZi7Zm8QjXKftx5DxaaEdNR2jX0h2yFSz1Q8gebCOGGzM7MbaI4BVcWksETqy2EvVm8PyWp+q1CJv0@vger.kernel.org
X-Gm-Message-State: APuU4Z9w6klZuZTWQk/JNrd+0pWYJs7K6eQjPorRFzMxCtk2hUrl7I4c
	DVsIoc9w1tqaDmtFGrQ4TslPsUNVan0Q9Ww9djFjPjelHawMPTr1zQ/zsnMWmzj21JAEewNqGei
	WAGUAswAexSg5kTf1agBdqLt7+YfNdcQ=
X-Gm-Gg: AYBFou1bgVeytluK/UZwiWuCqAqsbqVB3c7C1Nm5QPVDW3L3hw/1s5l25xb0gSZPYtf
	3VI/gr1/nWTIz9SHqnQxeg2hZV0foNNvmAVSJi9lDLbAw65aHRuMyxaQzgZ+4JXnM7niKhBveWu
	OvfyLbEznBBhAW0Ki9V56KTKItQp+19nIqDUE1r2T1WiepUIhLj2dYCnv4HnsotqWmQaftkQT1i
	KiDgR2LfbCSmukGidDu8t+LKDWEomxqxH1WpmbIu99+SNvREk8qk1L4nYaiY+4LwHPtiOk/vATY
	c0y2ftoMfIn1/917yau94UYW65+tm64q8VyFjFw+QrVnYgHp7/hOsBfx0GXVYlqTP27sieWCrWe
	Bx87zvACL/NC/sJy3HIqg5fRLPkVVTaW0vxD9JyRoEfFNgkiH5IoUsjzAM1AmgyyTNfSJZA==
X-Received: by 2002:a17:906:f596:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c5066d0bb14mr114825966b.43.1794383490428; Tue, 10 Nov 2026
 23:51:30 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:51:18 +0100
X-Gm-Features: AclHuK9CC8htHdABEClpUnIw4kUNRCRbcWaYA_peZjxEX-MI6234hqDvVucRruU
Message-ID: <CA+=Fv5QBnNipJH5SKKV0iiPc1CQz+6f8dGzsRoKt1riMNxxOOg@mail.gmail.com>
Subject: Re: [PATCH v9 12/15] alpha: Use the common syscall table
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

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/Makefile    | 14 +++++++---
>  arch/alpha/kernel/syscalls/syscall.tbl | 49 ----------------------------=
------
>  arch/alpha/kernel/systbls.S            |  1 +
>  3 files changed, 11 insertions(+), 53 deletions(-)
>
> diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/sysc=
alls/Makefile
> index b265e4bc16c2..03099daff6b9 100644
> --- a/arch/alpha/kernel/syscalls/Makefile
> +++ b/arch/alpha/kernel/syscalls/Makefile
> @@ -7,17 +7,23 @@ $(shell mkdir -p $(uapi) $(kapi))
>  syscall :=3D $(src)/syscall.tbl
>  syshdr :=3D $(srctree)/scripts/syscallhdr.sh
>  systbl :=3D $(srctree)/scripts/syscalltbl.sh
> +systbl_common :=3D $(srctree)/scripts/syscall_common.tbl
> +abis :=3D common,__clone3
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
> -$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> +$(uapi)/unistd_32.h: $(syscall) $(systbl_common) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
> +$(kapi)/syscall_table.h: $(syscall) $(systbl_common) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           +=3D unistd_32.h
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 59eb066a40bf..7066a3920899 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -463,52 +463,3 @@
>  532    common  getppid                         sys_getppid
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
> -534    common  pidfd_send_signal               sys_pidfd_send_signal
> -535    common  io_uring_setup                  sys_io_uring_setup
> -536    common  io_uring_enter                  sys_io_uring_enter
> -537    common  io_uring_register               sys_io_uring_register
> -538    common  open_tree                       sys_open_tree
> -539    common  move_mount                      sys_move_mount
> -540    common  fsopen                          sys_fsopen
> -541    common  fsconfig                        sys_fsconfig
> -542    common  fsmount                         sys_fsmount
> -543    common  fspick                          sys_fspick
> -544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          __sys__clone3
> -546    common  close_range                     sys_close_range
> -547    common  openat2                         sys_openat2
> -548    common  pidfd_getfd                     sys_pidfd_getfd
> -549    common  faccessat2                      sys_faccessat2
> -550    common  process_madvise                 sys_process_madvise
> -551    common  epoll_pwait2                    sys_epoll_pwait2
> -552    common  mount_setattr                   sys_mount_setattr
> -553    common  quotactl_fd                     sys_quotactl_fd
> -554    common  landlock_create_ruleset         sys_landlock_create_rules=
et
> -555    common  landlock_add_rule               sys_landlock_add_rule
> -556    common  landlock_restrict_self          sys_landlock_restrict_sel=
f
> -# 557 reserved for memfd_secret
> -558    common  process_mrelease                sys_process_mrelease
> -559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> -561    common  cachestat                       sys_cachestat
> -562    common  fchmodat2                       sys_fchmodat2
> -563    common  map_shadow_stack                sys_map_shadow_stack
> -564    common  futex_wake                      sys_futex_wake
> -565    common  futex_wait                      sys_futex_wait
> -566    common  futex_requeue                   sys_futex_requeue
> -567    common  statmount                       sys_statmount
> -568    common  listmount                       sys_listmount
> -569    common  lsm_get_self_attr               sys_lsm_get_self_attr
> -570    common  lsm_set_self_attr               sys_lsm_set_self_attr
> -571    common  lsm_list_modules                sys_lsm_list_modules
> -572    common  mseal                           sys_mseal
> -573    common  setxattrat                      sys_setxattrat
> -574    common  getxattrat                      sys_getxattrat
> -575    common  listxattrat                     sys_listxattrat
> -576    common  removexattrat                   sys_removexattrat
> -577    common  open_tree_attr                  sys_open_tree_attr
> -578    common  file_getattr                    sys_file_getattr
> -579    common  file_setattr                    sys_file_setattr
> -580    common  listns                          sys_listns
> -581    common  rseq_slice_yield                sys_rseq_slice_yield
> -582    common  fchroot                         sys_fchroot
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
> index 68f3e4f329eb..9a67d29f7818 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -7,6 +7,7 @@
>
>  #include <asm/unistd.h>
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)
>  #define __SYSCALL(nr, entry) .quad entry
>         .data
>         .align 3
>
> --
> 2.56.0
>

This also needs an adjustment when combined with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Following d38895ba9330 ("alpha: dispatch system calls from C"), Alpha
uses sys_clone3 directly. The ABI selection should therefore be:

  abis :=3D common,clone3

rather than common,__clone3. The removal of the old table entries
also conflicts because the clone3 entry has changed.

For testing, I skipped patch 11, removed the entries from 534 onward
as intended here, and selected common,clone3.

With those adjustments, full GENERIC SMP and DP264 UP builds passed
using GCC 14.2.1. The generated syscall numbers are unchanged.
Comparing the native dispatch entries shows only patch 10's intended
change at syscall 560; clone3 remains sys_clone3.

The only build warning was the previously observed saved_config
COMMON-symbol warning. I have not runtime-tested this combination.

Thanks,
Magnus
