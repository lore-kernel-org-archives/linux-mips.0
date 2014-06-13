Received: from mail-vc0-f178.google.com ([209.85.220.178]:61630 "EHLO
        mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825887AbaFMUl2XRxGd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Jun 2014 22:41:28 +0200
Received: by mail-vc0-f178.google.com with SMTP id ij19so2816154vcb.23
        for <linux-mips@linux-mips.org>; Fri, 13 Jun 2014 13:41:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1402457121-8410-7-git-send-email-keescook@chromium.org>
References: <1402457121-8410-1-git-send-email-keescook@chromium.org> <1402457121-8410-7-git-send-email-keescook@chromium.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 13 Jun 2014 13:41:02 -0700
Message-ID: <CALCETrVYVB0pMj61T9ZCAhgL6WYHAdDjiDe81O0e4tTQLtjDiQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] seccomp: add "seccomp" syscall
Content-Type: text/plain; charset=UTF-8
Return-Path: <luto@amacapital.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Alexei Starovoitov <ast@plumgrid.com>, John Johansen <john.johansen@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>
Message-ID: <20140613204102.c96wTqtoB71BRQ4rXDUrJkoopQlRvqKyhN03H3cQBss@z>

On Tue, Jun 10, 2014 at 8:25 PM, Kees Cook <keescook@chromium.org> wrote:
> This adds the new "seccomp" syscall with both an "operation" and "flags"
> parameter for future expansion. The third argument is a pointer value,
> used with the SECCOMP_SET_MODE_FILTER operation. Currently, flags must
> be 0. This is functionally equivalent to prctl(PR_SET_SECCOMP, ...).

Question for the linux-abi people:

What's the preferred way to do this these days?  This syscall is a
general purpose "adjust the seccomp state" thing.  The alternative
would be a specific new syscall to add a filter with a flags argument.

--Andy
