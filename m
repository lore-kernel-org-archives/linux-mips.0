Received: from mailapp01.imgtec.com ([195.59.15.196]:63824 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008588AbcAVFT44qfUz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jan 2016 06:19:56 +0100
Date: Fri, 22 Jan 2016 05:20:17 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/7] MIPS: math-emu: Branch delay slot emulation fixes
Message-ID: <alpine.DEB.2.00.1601220227590.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org
Message-ID: <20160122052017.T4j1Pg_DlA6o0dahqOxhgB4feXb2qs8EP1nSbzp-kpY@z>

Hi,

 This small patch series addresses the following issues with branch delay 
slot emulation in our floating-point emulator:

- NOP emulation sometimes causes SIGILL (Aurelien's bug),

- microMIPS emulation always goes astray,

- microMIPS emulation of ADDIUPC always returns the wrong result.

Also included are a bunch of code clean-ups and comment fixes.  See 
individual patch descriptions for further details.

 I attempted to move clean-ups to the end, so that they do not interfere 
with backporting, except with 2/7 which, if reordered, would require 3/7 
to become ill-formatted.  I hope this is OK.  Changes 5-7/7 do not require 
backporting.

 This series has been validated with a MIPS M5150 processor.

  Maciej
