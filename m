Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:56765 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992851AbeEOWdPYTmjS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 May 2018 00:33:15 +0200
Date: Tue, 15 May 2018 23:32:11 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH 0/3] MIPS: DSP ASE regset support
Message-ID: <alpine.DEB.2.00.1804301557320.11756@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-fsdevel@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180515223211.P0g79YXQF4HJMbd-g_XJZSaY-bky5afmCsph_Q_1PEU@z>

Hi,

 For years, quite oddly, we have been missing DSP ASE register state from 
core files.  These days regsets are used to define what goes into a core 
file, so here's a change adding one.

 As a side effect ptrace(2) can now also access this regset, however no 
complementing client implementation has been made.  Eventually that'll 
have to change though so that DSP ASE registers can be correctly accessed 
in n32 processes, which suffer from ptrace(2) 32-bit data types truncating 
contents exchanged by PTRACE_PEEKUSR and PTRACE_POKEUSR requests with 
64-bit registers and no means defined to access partial registers via this 
API.

 In the course of this implementation I came across two bugs affecting the 
area being updated and hence this has become a small patch series with the 
audience wider than originally expected.

 See individual commit descriptions for the details of changes made.  

 NB there is no strict functional dependency between 1/3 and 2/3-3/3, so 
the order of commits does not have to be preserved as far as these two 
subsets are concerned.  However 3/3 does trigger the problem addressed 
with 1/3 (and gracefully handles it), hence the grouping in a series.

 Please apply.

  Maciej
