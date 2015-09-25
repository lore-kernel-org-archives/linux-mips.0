Received: from mailapp01.imgtec.com ([195.59.15.196]:34472 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008548AbbIYMsnSHrJa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Sep 2015 14:48:43 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 832CEFB9BF6F1
        for <linux-mips@linux-mips.org>; Fri, 25 Sep 2015 13:48:35 +0100 (IST)
Date: Fri, 25 Sep 2015 13:48:37 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [PATCH v2] MIPS: kernel: scall: Always run the seccomp syscall
 filters
Message-ID: <20150925124836.GB15565@mchandras-linux.le.imgtec.org>
References: <1442995677-20591-1-git-send-email-markos.chandras@imgtec.com>
 <1443165462-5875-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1443165462-5875-1-git-send-email-markos.chandras@imgtec.com>
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20150925124837.Y8lzAX2z9r3g8rfYieX-FU09WOWWq9zgQvY_Xzs154A@z>

On Fri, Sep 25, 2015 at 08:17:42AM +0100, Markos Chandras wrote:
> The MIPS syscall handler code used to return -ENOSYS on invalid
> syscalls. Whilst this is expected, it caused problems for seccomp
> filters because the said filters never had the change to run since
> the code returned -ENOSYS before triggering them. This caused
> problems on the chromium testsuite for filters looking for invalid
> syscalls. This has now changed and the seccomp filters are always
> run even if the syscall is invalid. We return -ENOSYS once we
> return from the seccomp filters. Moreover, similar codepath have
> been merged in the process which simplifies somewhat the overall
> syscall code.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
Ralf,

I didn't add CC: stable 3.15+ on this patch. Feel free to add it yourself if you
think this patch is useful for stable releases.

-- 
markos
