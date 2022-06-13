<template>
    <div class="mainnews">
      <img :src="imgprop" class="newsimg">

       <div class="newspass">
                <slot name="header" ></slot>
               <slot></slot>

       </div>

    </div>
</template>

<script>
  export default {
      name: 'news',
      props:{
        imgprop:{

        }
      }


  };
</script>

<style>


  .mainnews{
    width: 1170px;
    height: 385px;
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
  }

  .newsimg{

        width:70%;
        height: 100%;

  }
  .newspass{
   width: 30%;
   height: 100%;
   display: flex;
   flex-flow: column;
   justify-content: center;
   align-items: center;
   background-color: #f2f2f2;
  }


</style>
