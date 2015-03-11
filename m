Received: from mail-vc0-f173.google.com ([209.85.220.173]:52678 "EHLO
        mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008511AbbCKTAAvtAod (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Mar 2015 20:00:00 +0100
Received: by mail-vc0-f173.google.com with SMTP id hy10so3739997vcb.4
        for <linux-mips@linux-mips.org>; Wed, 11 Mar 2015 11:59:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1425518828-16017-1-git-send-email-keescook@chromium.org>
References: <1425518828-16017-1-git-send-email-keescook@chromium.org>
Date: Wed, 11 Mar 2015 11:59:55 -0700
Message-ID: <CAGXu5j+PMBEPLTLiDVZ9XvnT9a2P+tOGPLXfE865crteeChDFQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] switch to using asm-generic for seccomp.h
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@arm.linux.org.uk>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "David S. Miller" <davem@davemloft.net>, "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Daniel Borkmann <dborkman@redhat.com>, Laura Abbott <lauraa@codeaurora.org>, James Hogan <james.hogan@imgtec.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, sparclinux <sparclinux@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>
Message-ID: <20150311185955.9VAjcU05ARpQTHZoSId7JWIQK-_l-23N6O8obuMzShQ@z>

On Wed, Mar 4, 2015 at 5:27 PM, Kees Cook <keescook@chromium.org> wrote:
> Most architectures don't need to do much special for the strict-mode
> seccomp syscall entries. Remove the redundant headers and reduce the
> others.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Hi Andrew,

Just a quick ping: are you able to pick up this series, or should I
try to get this in on a per-arch basis?

Thanks!

-Kees

> ---
> v3:
> - split patch series by architecture
> - fix up architectures that need sigreturn overrides (ingo)
> v2:
> - use Kbuild "generic-y" instead of explicit #include lines (sfr)
>



-- 
Kees Cook
Chrome OS Security
