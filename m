Received: from blu0-omc4-s21.blu0.hotmail.com ([65.55.111.160]:63191 "EHLO
        blu0-omc4-s21.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491038Ab1AGPpQ convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 7 Jan 2011 16:45:16 +0100
Message-ID: <BLU124-W490D65550F59FC3E0B692A60B0@phx.gbl>
From: Erich Mierzejewski <mierz@hotmail.com>
Subject: [kernel oops] Cavium Octeon, linux 2.6.27
Date: Fri, 7 Jan 2011 10:45:06 -0500
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <mierz@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20110107154506.rugKNQuZv1dQ25qiYD5eQkc3uwOspWyuVzbc3DwNkbI@z>


I am facing an intermittent Oops on Cavium-Octeon CN56xx.  The oops is related to networking, and typically includes TIPC (virtually all inter-node comms is using TIPC).  It takes about 2-3 hours of running a directed TIPC client/server test to invoke the oops.  

The signature varies, but typically includes either sock_sendmsg or sock_poll.   Here's an example captured from syslog with sock_poll.   

Feb  5 11:18:42 mpc_1_1 kernel: CPU 2 Unable to handle kernel paging request at virtual address ffffffffc016f970, epc == ffffffff813e8ec4, ra == ffffffff81235658
Feb  5 11:18:44 mpc_1_1 kernel: Oops[#1]:
Feb  5 11:18:44 mpc_1_1 kernel: Cpu 3
Feb  5 11:18:44 mpc_1_1 kernel: $ 0   : 0000000000000000 0000000000000001 ffffffffc016f930 a8000000e9e2aa00
Feb  5 11:18:44 mpc_1_1 kernel: $ 4   : a8000000e92f8600 0000000000000000 0000000000000000 00000000000003e8
Feb  5 11:18:44 mpc_1_1 kernel: $ 8   : 0000000000416248 00000000004186e8 000000007fdba9e0 000000000040243c
Feb  5 11:18:44 mpc_1_1 kernel: $12   : 0000000000000000 ffffffffc0000008 ffffffff81235400 ffffffff89a0a600
Feb  5 11:18:44 mpc_1_1 kernel: $16   : a8000000bc9ec700 a8000000bc9ec718 0000000000000000 a8000000e92f8000
Feb  5 11:18:44 mpc_1_1 kernel: $20   : 0000000000000001 000000007fdba9b0 a8000000e92f8070 0000000000000000
Feb  5 11:18:44 mpc_1_1 kernel: $24   : 0000000000000400 0000000038fbd038                        
Feb  5 11:18:44 mpc_1_1 kernel: $28   : a8000000b9d64000 a8000000b9d67dc0 a8000000e92f9300 ffffffff81235658
Feb  5 11:18:44 mpc_1_1 kernel: Hi    : 0000000000007d7f
Feb  5 11:18:44 mpc_1_1 kernel: Lo    : df3b645a1cac9d39
Feb  5 11:18:44 mpc_1_1 kernel: epc   : ffffffff813e8ec4 sock_poll+0xc/0x18
Feb  5 11:18:44 mpc_1_1 kernel: Not tainted
Feb  5 11:18:44 mpc_1_1 kernel: ra    : ffffffff81235658 SyS_epoll_wait+0x258/0x560
Feb  5 11:18:44 mpc_1_1 kernel: Status: 1000cce3    KX SX UX KERNEL EXL IE
Feb  5 11:18:44 mpc_1_1 kernel: Cause : 00800008
Feb  5 11:18:44 mpc_1_1 kernel: BadVA : ffffffffc016f970
Feb  5 11:18:44 mpc_1_1 kernel: PrId  : 000d0409 (Cavium Octeon)
Feb  5 11:18:44 mpc_1_1 kernel: Modules linked in: usbcore bonding i2c_dev x_tables ip6_tables ip_tables ipv6 libcrc32c sctp spioc binfmt_misc jazz_mod iptable_filter tunnel4 sit ipmi_msghandler ipmi_serial ipmi_serial_terminal_mode ipmi_devintf ipmi_watchdog tipc dti si5326 mt29f
Feb  5 11:18:44 mpc_1_1 kernel: Process tipcServer_mpc (pid: 8226, threadinfo=a8000000b9d64000, task=a8000000bca5e900, tls=000000002ad009a0)
Feb  5 11:18:44 mpc_1_1 kernel: Stack : a8000000b9d67dc0 a8000000b9d67dc0 0000000000000001 0000000000000000
Feb  5 11:18:44 mpc_1_1 kernel: 0000000000000081 0000000000416234 0000000000000001 000000000041e060
Feb  5 11:18:44 mpc_1_1 kernel: a8000000e92f8010 a8000000e92f8030 a8000000e92f8050 a8000000e92f8060
Feb  5 11:18:44 mpc_1_1 kernel: 00000000000000fa a8000000e92f8040 0000000000404db8 0000000000401220
Feb  5 11:18:44 mpc_1_1 kernel: 00000000004b0000 00000000004e8450 00000000004e05f8 00000000004e8450
Feb  5 11:18:44 mpc_1_1 kernel: 0000000000000000 00000000004ed948 000000007fdba968 ffffffff8114732c
Feb  5 11:18:44 mpc_1_1 kernel: 0000000000000000 ffffffff81103be4 000000000000109a 000000002acf9530
Feb  5 11:18:44 mpc_1_1 kernel: 0000000000000003 000000007fdba9b0 0000000000000001 00000000000003e8
Feb  5 11:18:44 mpc_1_1 kernel: 0000000000000001 00000000203d2025 0000000025252525 ffffffff81010100
Feb  5 11:18:44 mpc_1_1 kernel: 0000000000000000 0000000000000010 ffffffff813eaf18 ffffffff89a0a600
Feb  5 11:18:44 mpc_1_1 kernel: ...
Feb  5 11:18:44 mpc_1_1 kernel: Call Trace:
Feb  5 11:18:44 mpc_1_1 kernel: [<ffffffff813e8ec4>] sock_poll+0xc/0x18
Feb  5 11:18:44 mpc_1_1 kernel: [<ffffffff81235658>] SyS_epoll_wait+0x258/0x560
Feb  5 11:18:44 mpc_1_1 kernel: [<ffffffff8114732c>] handle_sys+0x12c/0x148
Feb  5 11:18:44 mpc_1_1 kernel:
Feb  5 11:18:44 mpc_1_1 kernel:
Feb  5 11:18:44 mpc_1_1 kernel: Code: dc830098  00a0302d  dc620010 <dc590040> 03200008  0060282d  dc830098  00a0302d  dc620010
Feb  5 11:18:44 mpc_1_1 kernel: TIPC: Resetting link <1.1.11:bond0-1.1.101:bond0>, requested by peer
Feb  5 11:18:44 mpc_1_1 kernel: TIPC: Lost link <1.1.11:bond0-1.1.101:bond0> on network plane A
Feb  5 11:18:44 mpc_1_1 kernel: TIPC: Lost contact with <1.1.101>
Feb  5 11:18:44 mpc_1_1 kernel: TIPC: Established link <1.1.11:bond0-1.1.101:bond0> on network plane A


Looking at the disassembly of sock_poll, it can be seen that the error occurs when dereferencing ops->poll to store the function pointer in register t9.  

0000000000000048 <sock_poll>:
        struct socket *sock;

        /*
         *      We can't return errors to poll, so it's either yes or no.
         */
        sock = file->private_data;
      48:       dc830098        ld      v1,152(a0)
        return sock->ops->poll(file, sock, wait);
      4c:       00a0302d        move    a2,a1
      50:       dc620010        ld      v0,16(v1)
      54:       dc590040        ld      t9,64(v0)
      58:       03200008        jr      t9
      5c:       0060282d        move    a1,v1

The register file corroborates BadVA to (64)v0, with v0 holding a value of ffffffffc016f930.  

I originally thought this address _was_ bad because all of the kernel code addresses are in the range ffffffff81xxxxxx.  Then it occurred that modules might be loaded at a different address, so checking a live system:

/tmp> grep ffffffffc016f930 /proc/kallsyms
ffffffffc016f930 r msg_ops      [tipc]
/tmp>

Based on this, it seems that sock->ops is valid and correct, and my original assumption about corrupt address was wrong.  I'm left to conclude that the virtual address is correct, but page mapping operation is failing for some other reason.  

Strangely, the mapping fails only intermittently/temporarily.  I conclude this because only one of many processes using TIPC will oops out, while others continue unaffected.  This can be seen in the syslog above in the last 4 lines, as a TIPC link moves from Resetting->Lost->Established. 

Some other (less important?) details:
TIPC is the only protocol loaded as a module. 
Kernel is 64 bit, but userspace is O32 due to some old 3rd party libraries.  
Typically, the processes running TIPC have their core mask set to 0x000F, to limit them to cores 0-3.  I'm repeating the tests with all processes running only on core 0 to see if SMP might be a factor.  


What might be going on here?  Could a page mapping fail even if the VA has a physical mapping in the page table?  Could TIPC module be at fault (how)?  What else can I look at to track down what might be happening?  

Best regards, 

-Erich

 		 	   		  
