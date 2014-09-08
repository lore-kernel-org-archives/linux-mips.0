Received: from terminus.zytor.com ([198.137.202.10]:55916 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27008488AbaIHTuJ5bsQ0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 8 Sep 2014 21:50:09 +0200
Message-ID: <540E0860.2030600@zytor.com>
Date: Mon, 08 Sep 2014 12:49:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/5] x86: two-phase syscall tracing and seccomp fastpath
References: <cover.1409954077.git.luto@amacapital.net> <CAGXu5jJpxzbpZfxXoBvDm6W-ogq3d5njRa2ir0text3evJT+QQ@mail.gmail.com>
In-Reply-To: <CAGXu5jJpxzbpZfxXoBvDm6W-ogq3d5njRa2ir0text3evJT+QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-Path: <hpa@zytor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Will Drewry <wad@chromium.org>, Oleg Nesterov <oleg@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, Frederic Weisbecker <fweisbec@gmail.com>
Message-ID: <20140908194952.Kr7lssm_rpfASzsFiLVxfFYpfBzP6cTQ-YG6AMfYFVQ@z>

On 09/08/2014 12:29 PM, Kees Cook wrote:
> 
> As far as doing pulls, Peter, can you take the seccomp change from my
> tree as well? It makes sense to land all of this together.
> 

That is the plan.

	-hpa
