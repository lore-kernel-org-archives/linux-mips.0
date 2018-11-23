Received: from mail.kernel.org ([198.145.29.99]:37314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990437AbeKWHadjJbYT (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 23 Nov 2018 08:30:33 +0100
Date: Fri, 23 Nov 2018 07:30:31 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: Re: [for-next][PATCH 06/18] MIPS: function_graph: Simplify with function_graph_entry()
In-Reply-To: <20181122003332.209589047@goodmis.org>
References: <20181122003332.209589047@goodmis.org>
Message-ID: <20181123073031.E544820861@mail.kernel.org>
Return-Path: <sashal@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sasha Levin <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>"Steven Rostedt (VMware)" <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, stable@kernel.org, stable@vger.kernel.org
Message-ID: <20181123073031.ZBkAlvXp-ibNXEnyHTxS_vG8pAgD1qfE3WNSRFhP5hA@z>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 03274a3ffb44 tracing/fgraph: Adjust fgraph depth before calling trace return callback.

The bot has tested the following trees: v4.19.3, v4.14.82, v4.9.138, v4.4.164, v3.18.126.

v4.19.3: Build OK!
v4.14.82: Build OK!
v4.9.138: Failed to apply! Possible dependencies:
    Unable to calculate

v4.4.164: Failed to apply! Possible dependencies:
    Unable to calculate

v3.18.126: Failed to apply! Possible dependencies:
    Unable to calculate


How should we proceed with this patch?

--
Thanks,
Sasha
