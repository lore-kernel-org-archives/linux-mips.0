Received: from mailapp01.imgtec.com ([195.59.15.196]:45088 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855205AbaHRN7lYlVhw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Aug 2014 15:59:41 +0200
Date: Mon, 18 Aug 2014 14:59:33 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [request for stable inclusion] MIPS: math-emu: Fix instruction
 decoding
Message-ID: <20140818135933.GA1214@mchandras-linux.le.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
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
To: stable@vger.kernel.org
Cc: linux-mips@linux-mips.org
Message-ID: <20140818135933.Xv6p-lQwJBtxxm_brUtcPbqLwsBqlRxAClov_ydKBDM@z>

Hi Greg,

Could you please apply the following patch to the 3.16.X stable kernels?

c3b9b945e02e011c63522761e91133ea43eb6939
"MIPS: math-emu: Fix instruction decoding"

Thank you

-- 
markos
