Received: from mail-oa0-f41.google.com ([209.85.219.41]:63972 "EHLO
        mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6861349AbaGRWQnsHihl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 19 Jul 2014 00:16:43 +0200
Received: by mail-oa0-f41.google.com with SMTP id j17so4286492oag.14
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 15:16:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce65e0e8be18ae8fab437899db44ca41c912b506.1405717901.git.luto@amacapital.net>
References: <cover.1405717901.git.luto@amacapital.net>
        <ce65e0e8be18ae8fab437899db44ca41c912b506.1405717901.git.luto@amacapital.net>
Date: Fri, 18 Jul 2014 15:16:37 -0700
Message-ID: <CAGXu5jLsnSujJdZmA=nzHw1_K3eYhSiUEnntJ3S2hCZ8DFVYpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] seccomp: Allow arch code to provide seccomp_data
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <keescook@google.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andy Lutomirski <luto@amacapital.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Will Drewry <wad@chromium.org>, Oleg Nesterov <oleg@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20140718221637.oy3-UHSenXcP1n6NDR-GxU7rDmsuttl5ynTqZ1JVdKk@z>

On Fri, Jul 18, 2014 at 2:18 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> populate_seccomp_data is expensive: it works by inspecting
> task_pt_regs and various other bits to piece together all the
> information, and it's does so in multiple partially redundant steps.
>
> Arch-specific code in the syscall entry path can do much better.
>
> Admittedly this adds a bit of additional room for error, but the
> speedup should be worth it.

I still think we should gain either a note in the
HAVE_ARCH_SECCOMP_FILTER help text in arch/Kconfig, or possibly a new
section in Documentation/prctl/seccomp.txt (or similar) on how do
implement filter support for an architecture, that mentions the
arch-supplied seccomp_data and how two-phase can be done.

-Kees

-- 
Kees Cook
Chrome OS Security
